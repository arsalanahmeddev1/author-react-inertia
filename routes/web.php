<?php

use App\Http\Controllers\Auth\GuestAuthController;
use App\Http\Controllers\Auth\SocialAuthController;
use App\Http\Controllers\CommentsController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StoriesController;
use Illuminate\Support\Facades\Route;

Route::get('/', [HomeController::class, 'index'])->name('home');

Route::get('login/{provider}', [SocialAuthController::class, 'redirect'])->name('social.redirect');
Route::get('login/{provider}/callback', [SocialAuthController::class, 'callback'])->name('social.callback');

// Guest login route
Route::get('/guest-login', [GuestAuthController::class, 'guestLogin'])->name('guest.login');

// Logout and register route for guest users
Route::get('/logout-and-register', [GuestAuthController::class, 'logoutAndRegister'])->name('guest.logout.register');


// Stories routes
Route::get('/stories', [StoriesController::class, 'index'])->name('stories.index');
Route::get('/stories/{story}', [StoriesController::class, 'show'])->name('stories.show');
Route::get('/stories/{story}/read', [StoriesController::class, 'read'])->name('stories.read');

// Comments routes
Route::get('/stories/{story}/comments', [CommentsController::class, 'getComments'])->name('comments.get');
Route::middleware('auth')->group(function () {
    Route::post('/stories/{story}/comments', [CommentsController::class, 'store'])->name('comments.store');
    Route::put('/comments/{comment}', [CommentsController::class, 'update'])->name('comments.update')->whereNumber('comment');
    Route::delete('/comments/{comment}', [CommentsController::class, 'destroy'])->name('comments.destroy')->whereNumber('comment');
});

// Dashboard route removed - redirecting to home instead

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
