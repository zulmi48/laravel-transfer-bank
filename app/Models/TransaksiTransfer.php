<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransaksiTransfer extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_transaksi',
        'user_id',
        'bank_pengirim_id',
        'bank_tujuan_id',
        'rekening_tujuan',
        'atas_nama_tujuan',
        'nilai_transfer',
        'kode_unik',
        'biaya_admin',
        'total_transfer',
        'rekening_perantara',
        'bank_perantara_id',
        'berlaku_hingga',
    ];

    // Relasi ke User
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // Relasi ke Bank Pengirim
    public function bankPengirim()
    {
        return $this->belongsTo(Bank::class, 'bank_pengirim_id');
    }

    // Relasi ke Bank Tujuan
    public function bankTujuan()
    {
        return $this->belongsTo(Bank::class, 'bank_tujuan_id');
    }
}
