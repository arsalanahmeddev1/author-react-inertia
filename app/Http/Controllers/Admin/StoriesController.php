<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Story;
use Illuminate\Http\Request;
use Inertia\Inertia;

class StoriesController extends Controller
{
    /**
     * Display a listing of the stories.
     */
    public function index()
    {
        $stories = Story::select('id', 'title', 'author', 'genre', 'read_count', 'likes_count', 'comment_count', 'created_at', 'is_community')
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        return Inertia::render('admin/stories/Index', [
            'stories' => $stories,
        ]);
    }

    /**
     * Display the specified story.
     */
    public function show(Story $story)
    {
        return Inertia::render('admin/stories/Show', [
            'story' => $story,
        ]);
    }

    /**
     * Remove the specified story from storage.
     */
    public function destroy(Story $story)
    {
        $story->delete();

        return redirect()->route('admin.stories.index')
            ->with('success', 'Story deleted successfully.');
    }
} 