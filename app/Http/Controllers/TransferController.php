<?php

namespace App\Http\Controllers;

use App\Models\Bank;
use App\Models\RekeningAdmin;
use App\Models\TransaksiTransfer;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class TransferController extends Controller
{
    public function createTransfer(Request $request)
    {
        // 1. Validasi Input
        $validator = Validator::make($request->all(), [
            'nilai_transfer' => 'required|numeric|min:10000', // Nilai minimal transfer
            'bank_tujuan' => 'required|string|exists:banks,kode_bank', // Kode bank harus ada di tabel bank
            'rekening_tujuan' => 'required|string',
            'atasnama_tujuan' => 'required|string',
            'bank_pengirim' => 'required|string|exists:banks,kode_bank',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }

        // 2. Ambil data user yang sedang login
        $user = Auth::user();

        // 3. Ambil data bank pengirim dan tujuan
        $bankTujuan = Bank::where('kode_bank', $request->bank_tujuan)->first();
        $bankPengirim = Bank::where('kode_bank', $request->bank_pengirim)->first();

        // 4. Ambil rekening admin perantara
        // Logika: Jika bank pengirim dan tujuan berbeda, gunakan bank perantara, misal PT BosCOD Indonesia
        // Untuk saat ini kita ambil rekening admin BNI sebagai contoh
        $rekeningPerantara = RekeningAdmin::where('bank_id', $bankPengirim->id)->first();

        // 5. Generasi Kode Unik (3 digit)
        $kodeUnik = rand(100, 999); // Kode unik 3 digit

        // 6. Hitung total transfer (nilai transfer + kode unik)
        $totalTransfer = $request->nilai_transfer + $kodeUnik;

        // 7. Biaya Admin (diset nol karena transfer antar bank gratis)
        $biayaAdmin = 0;

        // 8. Generasi ID Transaksi dengan format TF{YYMMDD}{counter}
        $counter = TransaksiTransfer::count() + 1; // Menghitung jumlah transaksi untuk counter
        $idTransaksi = 'TF' . Carbon::now()->format('ymd') . str_pad($counter, 5, '0', STR_PAD_LEFT);

        // 9. Tentukan batas waktu transaksi berlaku (misal 1 hari)
        $berlakuHingga = Carbon::now()->addDay();

        // 10. Simpan transaksi ke database
        $transaksi = TransaksiTransfer::create([
            'id_transaksi' => $idTransaksi,
            'user_id' => $user->id,
            'bank_pengirim_id' => $bankPengirim->id,
            'bank_tujuan_id' => $bankTujuan->id,
            'rekening_tujuan' => $request->rekening_tujuan,
            'atas_nama_tujuan' => $request->atasnama_tujuan,
            'nilai_transfer' => $request->nilai_transfer,
            'kode_unik' => $kodeUnik,
            'biaya_admin' => $biayaAdmin,
            'total_transfer' => $totalTransfer,
            'rekening_perantara' => $rekeningPerantara->nomor_rekening,
            'bank_perantara_id' => $bankPengirim->id, // Bank perantara sama dengan bank pengirim (dalam hal ini BNI)
            'berlaku_hingga' => $berlakuHingga,
        ]);

        // 11. Response yang dikembalikan
        return response()->json([
            'id_transaksi' => $transaksi->id_transaksi,
            'nilai_transfer' => $transaksi->nilai_transfer,
            'kode_unik' => $transaksi->kode_unik,
            'biaya_admin' => $transaksi->biaya_admin,
            'total_transfer' => $transaksi->total_transfer,
            'bank_perantara' => $bankPengirim->nama_bank, // Bank perantara
            'rekening_perantara' => $transaksi->rekening_perantara,
            'berlaku_hingga' => $transaksi->berlaku_hingga->toIso8601String(), // Format ISO8601 untuk tanggal
        ]);
    }
}
