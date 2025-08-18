<?php

namespace App\Http\Controllers;

use App\Models\Story;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Inertia\Inertia;
use App\Models\PublishRequest;

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
            'flash' => [
                'success' => session('success'),
                'error' => session('error'),
            ],
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
        // Only increment read count for non-admin users (including guests)
        if (Auth::check() && Auth::user()->role !== 'admin') {
            // Check if this user has already read this story
            $existingRead = \App\Models\StoryRead::where('story_id', $story->id)
                ->where('user_id', Auth::id())
                ->first();

            // Only increment if this is a new read
            if (!$existingRead) {
                // Increment the read count
                $story->increment('read_count');

                // Track the read in the story_reads table
                $this->trackStoryRead($story);
            }
        }

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
        // Track reads for logged-in non-admin users (including guests)
        if (Auth::check() && Auth::user()->role !== 'admin') {
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
        $story->user_id = $user->id;
        $story->save();

        return response()->json([
            'success' => true,
            'message' => 'Story added to community successfully',
            'story' => $story,
        ]);
    }

    public function storeDraftSession(Request $request)
    {
        // Check if user is not logged in
        if (!Auth::check()) {
            return redirect()->route('login')->with('error', 'You must be logged in to publish stories.');
        }

        $user = Auth::user();

        // Check if user is a guest (is_guest = 1)
        if ($user->is_guest) {
            return redirect()->route('register')->with('error', 'Guest users cannot publish stories. Please create a full account to continue.');
        }

        // Check if user account is inactive (is_active = 0)
        if (!$user->is_active) {
            return redirect()->route('login')->with('error', 'Your account is inactive. Please contact support for assistance.');
        }

        session()->put('story_publish_data', $request->only(['story_id', 'character_name', 'content']));
        return redirect()->route('stories.publish.packages');
    }

    public function showPublishForm(Story $story)
    {
        // Check if user is not logged in
        if (!Auth::check()) {
            return redirect()->route('login')->with('error', 'You must be logged in to publish stories.');
        }

        $user = Auth::user();

        // Check if user is a guest (is_guest = 1)
        if ($user->is_guest) {
            return redirect()->route('register')->with('error', 'Guest users cannot publish stories. Please create a full account to continue.');
        }

        // Check if user account is inactive (is_active = 0)
        if (!$user->is_active) {
            return redirect()->route('login')->with('error', 'Your account is inactive. Please contact support for assistance.');
        }

        $prefill = session('story_publish_data');
        $story = $story;

        return Inertia::render('Stories/Publish/Form', [
            'prefill' => $prefill,
            'story' => $story
        ]);
    }

    public function showPackages()
    {
        // Check if user is not logged in
        if (!Auth::check()) {
            return redirect()->route('login')->with('error', 'You must be logged in to publish stories.');
        }

        $user = Auth::user();

        // Check if user is a guest (is_guest = 1)
        if ($user->is_guest) {
            return redirect()->route('register')->with('error', 'Guest users cannot publish stories. Please create a full account to continue.');
        }

        // Check if user account is inactive (is_active = 0)
        if (!$user->is_active) {
            return redirect()->route('login')->with('error', 'Your account is inactive. Please contact support for assistance.');
        }

        $session = session('story_publish_data');

        if (!$session || !isset($session['story_id'])) {
            return redirect()->route('stories.index')->with('error', 'Story session data not found.');
        }

        // ✅ Fetch story from DB using story_id from session
        $story = Story::find($session['story_id']);

        if (!$story) {
            return redirect()->route('stories.index')->with('error', 'Story not found.');
        }

        return Inertia::render('Stories/Publish/Packages', [
            'story' => $story,
        ]);
    }

    public function storePublishRequest(Request $request)
    {
        // Check if user is not logged in
        if (!Auth::check()) {
            return redirect()->route('login')->with('error', 'You must be logged in to publish stories.');
        }

        $user = Auth::user();

        // Check if user is a guest (is_guest = 1)
        if ($user->is_guest) {
            return redirect()->route('register')->with('error', 'Guest users cannot publish stories. Please create a full account to continue.');
        }

        // Check if user account is inactive (is_active = 0)
        if (!$user->is_active) {
            return redirect()->route('login')->with('error', 'Your account is inactive. Please contact support for assistance.');
        }

        try {
            $request->validate([
                'story_id' => 'required|exists:stories,id',
                'character' => 'required',
                'content' => 'required',
                'title' => 'required',
                'genre' => 'required',
            ]);

            // Get the story to access its cover_image
            $story = Story::findOrFail($request->story_id);

            $publishRequest = PublishRequest::create([
                'user_id' => Auth::id(),
                'cover_image' => $story->cover_image, // Get cover_image from the story
                'story_id' => $request->story_id,
                'title' => $request->title,
                'character' => $request->character,
                'genre' => $request->genre,
                'content' => $request->content,
                'status' => 'pending',
            ]);

            // Create a payment record for the successful payment
            Payment::create([
                'user_id' => Auth::id(),
                'publish_request_id' => $publishRequest->id,
                'stripe_payment_intent_id' => 'manual_' . time(), // Since we don't have the actual payment intent ID here
                'amount' => 19.00, // Fixed amount for publishing
                'currency' => 'USD',
                'status' => 'succeeded',
                'payment_method' => 'card',
                'description' => 'Story Publishing Package - ' . $request->title,
            ]);

            Log::info('Publish request created successfully', [
                'publish_request_id' => $publishRequest->id,
                'user_id' => Auth::id(),
                'story_id' => $request->story_id,
            ]);

            return redirect()->route('stories.index')->with('success', 'Your book is now in the publishing process!');
        } catch (\Exception $e) {
            Log::error('Error creating publish request', [
                'error' => $e->getMessage(),
                'request_data' => $request->all(),
            ]);
            
            return redirect()->back()->with('error', 'Failed to create publish request. Please try again.');
        }
    }
}
