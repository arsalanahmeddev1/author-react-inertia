<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class UserDashboardController extends Controller
{
    public function index()
    {
        $user = auth()->user();
        $totalStories = $user->stories()->count();
        $publishedStories = $user->stories()->where('status', 'published')->count();
        $totalReads = $user->stories()->sum('read_count');
        return Inertia::render('user/Dashboard', [
            'metrics' => [
                'totalStories' => $totalStories,
                'publishedStories' => $publishedStories,
                '$totalReads' => $totalReads,
            ]
        ]);

    }

    
}