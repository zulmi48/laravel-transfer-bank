<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\TransferController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::post('/auth/login', [AuthController::class, 'login']);
Route::post('/auth/update-token', [AuthController::class, 'refreshToken']);

Route::middleware(['auth:api'])->group(function () {
    Route::get('/user/profile', function () {
        return response()->json(['message' => 'This is a protected route.']);
    });
    Route::post('/transfer', [TransferController::class, 'createTransfer']);
});
