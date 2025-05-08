<?php

namespace App\Http\Controllers;

use App\Models\Story;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;

class HomeController extends Controller
{
    /**
     * Display the home page with featured stories.
     */
    public function index()
    {
        // Get the latest 3 stories for the "Other Stories" section
        $latestStories = Story::latest()
            ->take(3)
            ->get();

        // Log the stories to the Laravel log
        Log::info('Latest stories for home page:', ['count' => $latestStories->count(), 'stories' => $latestStories->toArray()]);

        return Inertia::render('Home', [
            'latestStories' => $latestStories,
        ]);
    }
}
