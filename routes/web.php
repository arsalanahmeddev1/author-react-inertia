<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Auth\GoogleController;
use App\Http\Controllers\Auth\GuestAuthController;
use App\Http\Controllers\Admin\StoriesController as AdminStoriesController;
use Laravel\Socialite\Facades\Socialite;
use App\Http\Controllers\Auth\SocialAuthController;
use App\Http\Controllers\CommentsController;
use App\Http\Controllers\CommunityController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\StoriesController;
use App\Http\Controllers\StoryDraftsController;
use App\Http\Controllers\StoryLikesController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\DashboardController;




Route::get('/', [HomeController::class, 'index'])->name('home');
// google auth 


Route::get('/auth/google/redirect', [GoogleController::class, 'redirect'])->name('google.redirect');
Route::get('/auth/google/callback', [GoogleController::class, 'callback'])->name('google.callback');


// Route::get('/auth/facebook/redirect', [FacebookController::class, 'redirect'])->name('facebook.redirect');
// Route::get('/auth/facebook/callback', [FacebookController::class, 'callback'])->name('facebook.callback');


// Guest login route
Route::get('/guest-login', [GuestAuthController::class, 'guestLogin'])->name('guest.login');

// Logout and register route for guest users
Route::get('/logout-and-register', [GuestAuthController::class, 'logoutAndRegister'])->name('guest.logout.register');


// Stories routes
Route::get('/stories', [StoriesController::class, 'index'])->name('stories.index');
Route::get('/stories/{story}', [StoriesController::class, 'show'])->name('stories.show');
Route::get('/stories/{story}/read', [StoriesController::class, 'read'])->name('stories.read');


// Community routes
Route::middleware('auth')->group(function () {
    Route::get('/community', [CommunityController::class, 'index'])->name('community.index');
    Route::get('/community/{story}', [CommunityController::class, 'show'])->name('community.show');
    Route::post('/community/store', [StoriesController::class, 'storeCommunity'])->name('community.store');
});

// Comments routes
Route::get('/stories/{story}/comments', [CommentsController::class, 'getComments'])->name('comments.get');
Route::middleware('auth')->group(function () {
    Route::post('/stories/{story}/comments', [CommentsController::class, 'store'])->name('comments.store');
    Route::put('/comments/{comment}', [CommentsController::class, 'update'])->name('comments.update')->whereNumber('comment');
    Route::delete('/comments/{comment}', [CommentsController::class, 'destroy'])->name('comments.destroy')->whereNumber('comment');
});

// Likes routes
Route::get('/stories/{story}/likes', [StoryLikesController::class, 'checkLikeStatus'])->name('likes.check');
Route::middleware('auth')->group(function () {
    Route::post('/stories/{story}/likes', [StoryLikesController::class, 'toggleLike'])->name('likes.toggle');
});

// Drafts routes
Route::middleware('auth')->group(function () {
    Route::get('/drafts', [StoryDraftsController::class, 'index'])->name('drafts.index');
    Route::post('/drafts', [StoryDraftsController::class, 'store'])->name('drafts.store');
    Route::put('/drafts/{draft}', [StoryDraftsController::class, 'update'])->name('drafts.update');
    Route::delete('/drafts/{draft}', [StoryDraftsController::class, 'destroy'])->name('drafts.destroy');
});


Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});


// Admin Routes
Route::prefix('admin-dashboard')->name('admin-dashboard.')->middleware(['auth', 'admin'])->group(function () {
    Route::get('/', [DashboardController::class, 'index'])->middleware(['auth']);

    Route::resource('users', UserController::class);
    Route::resource('stories', \App\Http\Controllers\Admin\StoriesController::class);
    Route::get('community/stories', [AdminStoriesController::class, 'communityStories'])->name('stories.community');


    Route::get('stories/pending', [\App\Http\Controllers\Admin\StoriesController::class, 'pending'])->name('stories.pending');
    Route::post('{story}/approve', [\App\Http\Controllers\Admin\StoriesController::class, 'approve'])->name('stories.approve');
    Route::post('{story}/reject', [\App\Http\Controllers\Admin\StoriesController::class, 'reject'])->name('stories.reject');
});

Route::prefix('user-dashboard')->name('user-dashboard.')->middleware(['auth', 'user'])->group(function() {
    Route::get('/', [DashboardController::class, 'index'])->name('index');
});


Route::get('/publish', function () {
    return Inertia::render('Publish');
})->name('publish');

require __DIR__ . '/auth.php';
