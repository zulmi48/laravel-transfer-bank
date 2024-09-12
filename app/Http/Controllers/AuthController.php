<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    // Login User
    public function login(Request $request)
    {
        // Validasi input
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 400);
        }

        $credentials = $request->only('email', 'password');

        // Verifikasi kredensial
        if (!$token = JWTAuth::attempt($credentials)) {
            return response()->json(['error' => 'Invalid Credentials'], 401);
        }

        // Jika berhasil, kembalikan token dan refresh token
        return response()->json([
            'accessToken' => $token,
            'refreshToken' => $this->generateRefreshToken($request->user())
        ]);
    }

    // Generate Refresh Token (Implementasi sementara)
    private function generateRefreshToken($user)
    {
        // Membuat refresh token
        return base64_encode(Str::random(40));
    }

    // Endpoint untuk refresh token
    public function refreshToken(Request $request)
    {
        $refreshToken = $request->input('token');
        // Validasi refresh token dan generate access token baru
        if ($this->isValidRefreshToken($refreshToken)) {
            $newToken = JWTAuth::fromUser($request->user());
            return response()->json([
                'accessToken' => $newToken,
                'refreshToken' => $refreshToken
            ]);
        }

        return response()->json(['error' => 'Invalid Refresh Token'], 401);
    }

    private function isValidRefreshToken($token)
    {
        return true;
    }
}
