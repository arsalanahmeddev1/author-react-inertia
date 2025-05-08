<?php

namespace App\Http\Controllers;

use App\Models\Story;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class CommunityController extends Controller
{
    /**
     * Display a listing of community stories.
     */
    public function index(Request $request)
    {
        $query = Story::where('is_community', true);

        // Filter by genre if provided
        if ($request->has('genre') && $request->genre !== 'all') {
            $query->where('genre', $request->genre);
        }

        // Search by title, description, or author if provided
        if ($request->has('search') && !empty($request->search)) {
            $query->where(function($q) use ($request) {
                $q->where('title', 'like', "%{$request->search}%")
                  ->orWhere('description', 'like', "%{$request->search}%")
                  ->orWhere('author', 'like', "%{$request->search}%");
            });
        }

        // Get all available genres for the filter dropdown
        $genres = Story::where('is_community', true)
                      ->whereNotNull('genre')
                      ->distinct()
                      ->pluck('genre');

        // Paginate the results - use fresh() to ensure we get the latest data
        $stories = $query->latest()->paginate(9)->withQueryString();

        // We'll keep the data refresh to ensure accurate counts
        // but we won't force a page refresh in the frontend
        foreach ($stories as $key => $story) {
            $stories[$key] = $story->fresh();
        }

        return Inertia::render('Community/Index', [
            'stories' => $stories,
            'genres' => $genres,
            'filters' => $request->only(['search', 'genre']),
        ]);
    }

    /**
     * Display the specified community story.
     */
    public function show(Story $story)
    {
        // Increment the read count
        $story->increment('read_count');

        // Track the read in the story_reads table
        $this->trackStoryRead($story);

        return Inertia::render('Community/Show', [
            'story' => $story,
            'auth' => [
                'user' => Auth::user(),
            ],
        ]);
    }

    /**
     * Track a story read in the database.
     */
    private function trackStoryRead(Story $story)
    {
        // Create a new StoryRead record
        $storyRead = new \App\Models\StoryRead([
            'story_id' => $story->id,
            'user_id' => Auth::id(),
            'ip_address' => request()->ip(),
            'user_agent' => request()->userAgent(),
        ]);

        $storyRead->save();
    }
}
