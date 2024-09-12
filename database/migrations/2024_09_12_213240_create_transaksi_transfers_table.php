<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('transaksi_transfers', function (Blueprint $table) {
            $table->id();
            $table->string('id_transaksi')->unique();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('bank_pengirim_id')->constrained('banks');
            $table->foreignId('bank_tujuan_id')->constrained('banks');
            $table->string('rekening_tujuan');
            $table->string('atas_nama_tujuan');
            $table->decimal('nilai_transfer', 15, 2);
            $table->integer('kode_unik');
            $table->decimal('biaya_admin', 15, 2)->default(0);
            $table->decimal('total_transfer', 15, 2);
            $table->string('rekening_perantara');
            $table->foreignId('bank_perantara_id')->constrained('banks');
            $table->dateTime('berlaku_hingga');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transaksi_transfers');
    }
};
