<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Visit;
use Inertia\Inertia;
use Illuminate\Support\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Story;
use App\Models\User;
use Illuminate\Support\Facades\DB;


class DashboardController extends Controller
{
    public function index()
    {
        $now = now();
        $startOfMonth = $now->copy()->startOfMonth();

        $visits = Visit::where('visited_at', '>=', $startOfMonth)->count();
        $uniqueUsers = Visit::where('visited_at', '>=', $startOfMonth)->distinct('ip_address')->count('ip_address');
        $pageviews = $visits;
        $newUsers = User::where('created_at', '>=', $startOfMonth)->count();

        return Inertia::render('admin/Dashboard', [
            'metrics' => [
                'visits' => $visits,
                'uniqueUsers' => $uniqueUsers,
                'pageviews' => $pageviews,
                'newUsers' => $newUsers,
                'usersCount' => User::count(),
                'totalUsers' => User::count(),
                'communityStoriesCount' => Story::community()->count(),
                'adminStoriesCount' => Story::standard()->count(),
                'userCountsByMonth' => User::monthlyRegistrations(),
                'communityStoriesByMonth' => Story::monthlyCountsByType('community'),
                'adminStoriesByMonth' => Story::monthlyCountsByType('admin'),
            ],
        ]);
    }
}
