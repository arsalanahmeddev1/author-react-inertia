<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Story;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;

class StoriesController extends Controller
{
    public function index()
    {
        $userId = Auth::user()->id;
        
        // Get community stories (stories added to community)
        $communityStories = Story::where('user_id', $userId)
            ->where('is_community', true)
            ->orderByDesc('id')
            ->paginate(10);
            
        // Get published stories (standard stories)
        $publishedStories = Story::where('user_id', $userId)
            ->where('is_community', false)
            ->orderByDesc('id')
            ->paginate(10);

        return Inertia::render('user/stories/Index', [
            'communityStories' => $communityStories,
            'publishedStories' => $publishedStories,
        ]);
    }

    public function create()
    {
        return Inertia::render('user/stories/Create');
    }

    public function store(Request $request)
    {
        // This will be implemented when the create form is ready
        return redirect()->route('user-dashboard.stories.index')
            ->with('success', 'Story created successfully.');
    }

    public function show(Story $story)
    {
        // Check if the story belongs to the authenticated user
        if ($story->user_id !== Auth::user()->id) {
            abort(403, 'Unauthorized action.');
        }

        return Inertia::render('user/stories/Show', [
            'story' => $story,
        ]);
    }

    public function edit(Story $story)
    {
        // Check if the story belongs to the authenticated user
        if ($story->user_id !== Auth::user()->id) {
            abort(403, 'Unauthorized action.');
        }

        return Inertia::render('user/stories/Edit', [
            'story' => $story,
        ]);
    }

    public function update(Request $request, Story $story)
    {
        // Check if the story belongs to the authenticated user
        if ($story->user_id !== Auth::user()->id) {
            abort(403, 'Unauthorized action.');
        }

        // This will be implemented when the edit form is ready
        return redirect()->route('user-dashboard.stories.index')
            ->with('success', 'Story updated successfully.');
    }

    public function destroy(Story $story)
    {
        // Check if the story belongs to the authenticated user
        if ($story->user_id !== Auth::user()->id) {
            abort(403, 'Unauthorized action.');
        }

        $story->delete();

        return redirect()->route('user-dashboard.stories.index')
            ->with('success', 'Story deleted successfully.');
    }

    public function toggleStatus(Request $request, Story $story)
    {
        // Check if the story belongs to the authenticated user
        if ($story->user_id !== Auth::user()->id) {
            abort(403, 'Unauthorized action.');
        }

        $story->update(['is_active' => $request->is_active]);

        return response()->json(['success' => true]);
    }
}
