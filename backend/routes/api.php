<?php

use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\RegisterController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/me', [ProfileController::class, 'index'])->middleware('auth:sanctum');

Route::post('/auth/login', [LoginController::class, 'login'])->name('api.auth.login');
Route::post('/auth/register', [RegisterController::class, 'register'])->name('api.auth.register');
