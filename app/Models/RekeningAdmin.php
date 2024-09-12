<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RekeningAdmin extends Model
{
    use HasFactory;

    protected $fillable = [
        'bank_id',
        'nomor_rekening',
        'pemilik_rekening',
    ];

    // Relasi ke Bank
    public function bank()
    {
        return $this->belongsTo(Bank::class, 'bank_id');
    }
}
