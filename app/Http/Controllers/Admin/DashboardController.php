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
        $now = Carbon::now();
        $startOfMonth = $now->copy()->startOfMonth();

        $visits = Visit::where('visited_at', '>=', $startOfMonth)->count();

        $uniqueUsers = Visit::where('visited_at', '>=', $startOfMonth)
            ->distinct('ip_address')
            ->count('ip_address');

        $pageviews = Visit::where('visited_at', '>=', $startOfMonth)->count();

        $newUsers = User::where('created_at', '>=', $startOfMonth)->count();
        $max = max($visits, $uniqueUsers, $pageviews, $newUsers);

        $usersCount = User::count();
        $communityStoriesCount = Story::community()->count();
        $adminStoriesCount = Story::standard()->count();
        $totalUsers = \App\Models\User::count();
        $now = Carbon::now();
        $userCountsByMonth = collect();
        for ($i = 11; $i >= 0; $i--) {
            $date = $now->copy()->subMonths($i);
            $month = $date->format('M'); // e.g., Jan, Feb, etc.
    
            $count = DB::table('users')
                ->whereYear('created_at', $date->year)
                ->whereMonth('created_at', $date->month)
                ->count();
    
            $userCountsByMonth->push([
                'month' => $month,
                'count' => $count,
            ]);
        }
        return Inertia::render('admin/Dashboard', [
            'metrics' => [
                'visits' => $visits,
                'uniqueUsers' => $uniqueUsers,
                'pageviews' => $pageviews,
                'newUsers' => $newUsers,
                'usersCount' => $usersCount,
                // 'income' => $income,
                'communityStoriesCount' => $communityStoriesCount,
                'adminStoriesCount' => $adminStoriesCount,
                'totalUsers' => $totalUsers,
                'userCountsByMonth' => $userCountsByMonth,
                'usersCount' => DB::table('users')->count(),

            ],
        ]);
    }
}
