<?php

use App\Http\Controllers\Api\EpisodeController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\RegisterController;
use App\Http\Controllers\Api\SeriesController;
use App\Http\Controllers\Api\SeriesEpisodeController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/me', [ProfileController::class, 'index'])->middleware('auth:sanctum');

Route::post('/auth/login', [LoginController::class, 'login'])->name('api.auth.login');
Route::post('/auth/register', [RegisterController::class, 'register'])->name('api.auth.register');
Route::get('/series', [SeriesController::class, 'index'])->name('api.series.index');
Route::get('/series/{series}', [SeriesController::class, 'show'])->name('api.series.show');
Route::post('/series/{series}/follow', [SeriesController::class, 'follow'])->name('api.series.follow')->middleware('auth:sanctum');
Route::get('/series/{series}/episodes', [SeriesEpisodeController::class, 'index'])->name('api.series.episodes.index');
Route::get('/series/{series}/episodes/{episode}', [SeriesEpisodeController::class, 'show'])->name('api.series.episodes.show');
Route::get('/episodes', [EpisodeController::class, 'index'])->name('api.episodes.index');
Route::get('/episodes/{episode}', [EpisodeController::class, 'show'])->name('api.episodes.show');
