<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Auth\GoogleController;
use App\Http\Controllers\Auth\GuestAuthController;
use App\Http\Controllers\Admin\StoriesController as AdminStoriesController;
use App\Http\Controllers\User\StoriesController as UserStoriesController;
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
use Inertia\Inertia;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\PublishRequestController;
use App\Http\Controllers\StoriesController as MainStoriesController;
use App\Http\Controllers\StripeController;
use App\Http\Controllers\User\UserDashboardController;
use App\Http\Controllers\ChatbotController;

Route::get('/', [HomeController::class, 'index'])->name('home');
// google auth 


Route::middleware('web')->group(function () {
    Route::get('/auth/google', [GoogleController::class, 'redirect'])->name('google.redirect');
    Route::get('/auth/google/callback', [GoogleController::class, 'callback']);
});

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

// Route::get('/packages', [PackagesController::class, 'index'])->name('packages.index');
Route::get('/stories/publish/packages', [StoriesController::class, 'showPackages'])->name('stories.publish.packages');

Route::post('/story/publish-request', [MainStoriesController::class, 'storePublishRequest'])->name('story.publish.request');

// Route::post('/stripe/checkout', [StripeController::class, 'createCheckoutSession'])->name('stripe.checkout');
// Route::get('/stripe/success', [StripeController::class, 'success'])->name('stripe.success');
// Route::get('/stripe/cancel', [StripeController::class, 'cancel'])->name('stripe.cancel');

Route::post('/stripe/payment-intent', [StripeController::class, 'createPaymentIntent']);
Route::post('/stripe/webhook', [StripeController::class, 'webhook']);

// Route::get('/stories/publish/form', function () {
//     return Inertia::render('Stories/Publish/Form');
// })->name('stories.publish.form');

Route::get('/stories/publish/form/{story}', [MainStoriesController::class, 'showPublishForm'])->name('stories.publish.form');

Route::post('/story/store-draft-session', [MainStoriesController::class, 'storeDraftSession'])->name('story.draft.session');



// Admin Routes
Route::prefix('admin-dashboard')->name('admin-dashboard.')->middleware(['auth', 'admin'])->group(function () {
    Route::get('/', [DashboardController::class, 'index'])->middleware(['auth']);

    Route::resource('users', UserController::class);
    Route::resource('stories', \App\Http\Controllers\Admin\StoriesController::class);
    Route::get('community/stories', [AdminStoriesController::class, 'communityStories'])->name('stories.community');


    Route::get('stories/pending', [\App\Http\Controllers\Admin\StoriesController::class, 'pending'])->name('stories.pending');
    Route::post('{story}/approve', [\App\Http\Controllers\Admin\StoriesController::class, 'approve'])->name('stories.approve');
    Route::post('{story}/reject', [\App\Http\Controllers\Admin\StoriesController::class, 'reject'])->name('stories.reject');
    Route::post('users/{user}/toggle-status', [UserController::class, 'toggleStatus'])->name('users.toggle-status');

    Route::get('publish-requests', [PublishRequestController::class, 'index'])->name('publish-requests');
    Route::patch('publish-requests/{publishRequest}/status', [PublishRequestController::class, 'updateStatus'])->name('admin.publish-requests.update-status');
});

Route::prefix('user-dashboard')->name('user-dashboard.')->middleware(['auth', 'user'])->group(function() {
    Route::get('/', [UserDashboardController::class, 'index'])->name('user.dashboard');
    Route::resource('stories', UserStoriesController::class);
});


Route::get('/publish', function () {
    return Inertia::render('Publish');
})->name('publish');
Route::get('/about', function () {
    return Inertia::render('About');
})->name('about');

Route::post('/chatgpt/send', [ChatbotController::class, 'send']);


require __DIR__ . '/auth.php';
