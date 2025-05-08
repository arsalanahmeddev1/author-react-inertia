<?php

namespace App\Http\Controllers;

use App\Models\Story;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Inertia\Inertia;

class StoriesController extends Controller
{
    /**
     * Display a listing of the stories.
     */
    public function index(Request $request)
    {
        $query = Story::query();

        // Filter by genre if provided
        if ($request->has('genre') && $request->genre !== 'all') {
            $query->where('genre', $request->genre);
        }

        // Search by title or description if provided
        if ($request->has('search') && !empty($request->search)) {
            $query->where(function($q) use ($request) {
                $q->where('title', 'like', "%{$request->search}%")
                  ->orWhere('description', 'like', "%{$request->search}%");
            });
        }

        // Get all available genres for the filter dropdown
        $genres = Story::select('genre')->distinct()->pluck('genre');

        // Paginate the results
        $stories = $query->latest()->paginate(9);

        return Inertia::render('Stories/Index', [
            'stories' => $stories,
            'genres' => $genres,
            'filters' => $request->only(['search', 'genre']),
        ]);
    }

    /**
     * Display the specified story.
     */
    public function show(Story $story)
    {
        // Increment the read count
        $story->increment('read_count');

        // Load the characters for this story
        $story->load('characters');

        return Inertia::render('Stories/Show', [
            'story' => $story,
        ]);
    }

    /**
     * Display the story for reading.
     */
    public function read(Story $story)
    {
        // Increment the read count
        $story->increment('read_count');

        return Inertia::render('Stories/Read', [
            'story' => $story,
            'auth' => [
                'user' => Auth::user(),
            ],
        ]);
    }
}
