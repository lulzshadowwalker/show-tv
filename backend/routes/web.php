<?php

use App\Http\Controllers\SearchController;
use App\Http\Controllers\SeriesController;
use App\Http\Controllers\Web\HomeController;
use App\Livewire\Random;
use App\Livewire\Settings\Appearance;
use App\Livewire\Settings\Password;
use App\Livewire\Settings\Profile;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index'])->name('home.index');
Route::get('/series/random', Random::class)->name('random.index');
Route::get('/search', [SearchController::class, 'index'])->name('search.index');
Route::get('/series/foo', [SeriesController::class, 'show'])->name('series.show');

Route::view('dashboard', 'dashboard')
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::middleware(['auth'])->group(function () {
    Route::redirect('settings', 'settings/profile');

    Route::get('settings/profile', Profile::class)->name('settings.profile');
    Route::get('settings/password', Password::class)->name('settings.password');
    Route::get('settings/appearance', Appearance::class)->name('settings.appearance');
});

require __DIR__ . '/auth.php';
