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
        // Only show non-community stories
        $query = Story::where('is_community', false);
        // Filter by genre if provided
        if ($request->has('genre') && $request->genre !== 'all') {
            $query->where('genre', $request->genre);
        }

        // Search by title or description if provided
        if ($request->has('search') && !empty($request->search)) {
            $query->where(function ($q) use ($request) {
                $q->where('title', 'like', "%{$request->search}%")
                    ->orWhere('description', 'like', "%{$request->search}%");
            });
        }

        // Get all available genres for the filter dropdown (only from non-community stories)
        $genres = Story::where('is_community', false)
            ->select('genre')
            ->distinct()
            ->pluck('genre');

        // Paginate the results - use fresh() to ensure we get the latest data
        $stories = $query->latest()->paginate(9);

        // We'll keep the data refresh to ensure accurate counts
        // but we won't force a page refresh in the frontend
        foreach ($stories as $key => $story) {
            $stories[$key] = $story->fresh();
        }

        return Inertia::render('Stories/Index', [
            'stories' => $stories,
            'genres' => $genres,
            'filters' => $request->only(['search', 'genre']),
        ]);
    }

    public function store(Request $request)
    {
        if (!Auth::check()) {
            return redirect()->back()->with('error', 'You must be logged in to submit a story.');
        }

        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
        ]);
        dd(Auth::user()->id);
        Story::create([
            'title' => $request->title,
            'content' => $request->content,

            'user_id' => Auth::id(),
            'status' => 'pending',
            'read_count' => 0,
            'likes_count' => 0,
            'comment_count' => 0,
            'is_community' => false,
        ]);

        return redirect()->back()->with('success', 'Story submitted for approval.');
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

        // Track the read in the story_reads table
        $this->trackStoryRead($story);

        return Inertia::render('Stories/Read', [
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

    /**
     * Store a community story.
     */
    public function storeCommunity(Request $request)
    {
        $user = Auth::user();

        $data = $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'character_id' => 'nullable|integer',
            'original_story_id' => 'required|integer|exists:stories,id',
        ]);

        // Get the original story
        $originalStory = Story::findOrFail($data['original_story_id']);

        // Create a new story for the community
        $story = new Story();
        $story->title = $data['title'];
        $story->description = "A continuation of \"{$originalStory->title}\" by {$user->name}";
        $story->author = $user->name;
        $story->genre = $originalStory->genre;
        $story->cover_image = $originalStory->cover_image;
        $story->content = $data['content'];
        $story->read_count = 0;
        $story->comment_count = 0;
        $story->is_community = true;
        $story->save();

        return response()->json([
            'success' => true,
            'message' => 'Story added to community successfully',
            'story' => $story,
        ]);
    }

    
}
