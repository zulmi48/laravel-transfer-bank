<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bank extends Model
{
    use HasFactory;

    protected $fillable = [
        'nama_bank',
        'kode_bank',
    ];

    // Relasi ke transaksi sebagai bank pengirim
    public function transaksiPengirim()
    {
        return $this->hasMany(TransaksiTransfer::class, 'bank_pengirim_id');
    }

    // Relasi ke transaksi sebagai bank tujuan
    public function transaksiTujuan()
    {
        return $this->hasMany(TransaksiTransfer::class, 'bank_tujuan_id');
    }
}
