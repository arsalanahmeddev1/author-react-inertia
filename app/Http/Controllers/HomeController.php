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
        // Get the latest 3 non-community stories for the "Other Stories" section
        $latestStories = Story::where('is_community', false)
            ->latest()
            // ->take(3)
            ->get();

        // We'll keep the data refresh to ensure accurate counts
        // but we won't force a page refresh in the frontend
        foreach ($latestStories as $key => $story) {
            $latestStories[$key] = $story->fresh();
        }

        // Log the stories to the Laravel log
        Log::info('Latest stories for home page:', ['count' => $latestStories->count(), 'stories' => $latestStories->toArray()]);

        // Ensure the data is properly formatted for Inertia
        $formattedStories = $latestStories->map(function ($story) {
            return [
                'id' => $story->id,
                'title' => $story->title,
                'author' => $story->author,
                'cover_image' => $story->cover_image,
                'read_count' => $story->read_count,
                'comment_count' => $story->comment_count,
                'description' => $story->description,
                'genre' => $story->genre,
            ];
        });

        // Debug output to server log
        Log::info('Formatted stories for home page:', ['formatted' => $formattedStories->toArray()]);

        return Inertia::render('Home', [
            'latestStories' => $formattedStories,
        ]);
    }
}
