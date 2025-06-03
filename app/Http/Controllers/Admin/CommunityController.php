<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Community;
use App\Models\Story;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class CommunityController extends Controller
{
  /**
   * Display a listing of the stories.
   */
  public function index()
  {
    $stories = Community::select('id', 'title', 'author', 'genre', 'read_count', 'likes_count', 'comment_count', 'created_at', 'is_community', 'status',)
      ->where('is_community', true)
      ->orderBy('created_at', 'desc')
      ->paginate(10);

    return Inertia::render('admin/community/Index', [
      'stories' => $stories,
    ]);
  }

  public function pending()
  {
    $stories = Story::where('status', 'pending')->orderBy('created_at', 'desc')->paginate(10);

    return Inertia::render('admin/stories/Pending', [
      'stories' => $stories,
      'pageTitle' => 'Pending Stories',
    ]);
  }


  public function approve(Story $story)
  {
    $story->update(['status' => 'approved']);
    return redirect()->back()->with('success', 'Story approved.');
  }

  public function reject(Story $story)
  {
    $story->update(['status' => 'rejected']);
    return redirect()->back()->with('success', 'Story rejected.');
  }

  // public function standardStories()
  // {
  //     $stories = Story::select('id', 'title', 'author', 'genre', 'read_count', 'likes_count', 'comment_count', 'created_at', 'is_community')
  //         ->where('is_community', false)
  //         ->orderBy('created_at', 'desc')
  //         ->paginate(10);

  //     return Inertia::render('admin/stories/Index', [
  //         'stories' => $stories,
  //         'pageTitle' => 'Standard Stories',
  //         'storyType' => 'standard'
  //     ]);
  // }

  public function communityStories()
  {
    $stories = Story::select('id', 'title', 'author', 'genre', 'read_count', 'likes_count', 'comment_count', 'created_at', 'is_community')
      ->where('is_community', true)
      ->orderBy('created_at', 'desc')
      ->paginate(10);

    return Inertia::render('admin/stories/Index', [
      'stories' => $stories,
      'pageTitle' => 'Community Stories',
      'storyType' => 'community'
    ]);
  }

  public function create()
  {
    return Inertia::render('admin/community/Create');
  }

  /**
   * Store a newly created story in storage.
   */
  public function store(Request $request)
  {
    $validated = $request->validate([
      'title' => 'required|string|max:255',
      'description' => 'required|string',
      'author' => 'required|string|max:255',
      'genre' => 'required|string|max:100',
      'style' => 'nullable|string|max:255',
      'content' => 'required|string',
      'cover_image' => 'nullable|image|max:2048', // Max 2MB
      'characters' => 'nullable|array',
      'characters.*.name' => 'required|string|max:255',
      'characters.*.description' => 'nullable|string',
    ]);

    $storyData = [
      'title' => $validated['title'],
      'description' => $validated['description'],
      'author' => $validated['author'],
      'genre' => $validated['genre'],
      'style' => $validated['style'] ?? null,
      'content' => $validated['content'],
      'is_community' => true, // Admin-created stories are not community stories
      'read_count' => 0,
      'likes_count' => 0,
      'comment_count' => 0,
      'user_id' => auth()->id(),

    ];

    // Handle cover image upload
    if ($request->hasFile('cover_image')) {
      $path = $request->file('cover_image')->store('cover_images', 'public');
      $storyData['cover_image'] = $path;
    }

    $community = Community::create($storyData);

    // Create characters for the story if provided
    if (isset($validated['characters']) && is_array($validated['characters'])) {
      foreach ($validated['characters'] as $characterData) {
        $community->characters()->create([
          'name' => $characterData['name'],
          'description' => $characterData['description'] ?? '',
        ]);
      }
    }

    return redirect()->route('admin.community.index')
      ->with('success', 'Story created successfully.');
  }

  /**
   * Display the specified story.
   */
  public function show(Story $story)
  {
    // Load the characters relationship
    $story->load('characters');

    return Inertia::render('admin/community/Show', [
      'story' => $story,
    ]);
  }

  public function edit(Community $community)
{
    if (!$community->exists) {
        return redirect()->route('admin.community.index')->with('error', 'Story not found.');
    }
    if (!$community->is_community) {
        return redirect()->route('admin.community.index')->with('error', 'This is not a community story.');
    }
    $community->load('characters');
    return Inertia::render('admin/community/Edit', [
        'story introducing: story' => $community, // Keep 'story' prop for frontend compatibility
    ]);
}

  public function update(Request $request, Community $community)
  {
    $validated = $request->validate([
      'title' => 'required|string|max:255',
      'description' => 'required|string',
      'author' => 'required|string|max:255',
      'genre' => 'required|string|max:100',
      'style' => 'nullable|string|max:255',
      'content' => 'required|string',
      'cover_image' => 'nullable|image|max:2048', // Max 2MB
      'characters' => 'nullable|array',
      'characters.*.name' => 'required|string|max:255',
      'characters.*.description' => 'nullable|string',
      'character_updates' => 'nullable|array',
      'character_deletes' => 'nullable|array',
    ]);

    $storyData = [
      'title' => $validated['title'],
      'description' => $validated['description'],
      'author' => $validated['author'],
      'genre' => $validated['genre'],
      'style' => $validated['style'] ?? $story->style,
      'content' => $validated['content'],
    ];

    // Handle cover image upload
    if ($request->hasFile('cover_image')) {
      // // Delete the old image if it exists
      // if ($story->cover_image) {
      //     Storage::disk('public')->delete($story->cover_image);
      // }

      $path = $request->file('cover_image')->store('cover_images', 'public');
      $storyData['cover_image'] = $path;
    }

    $story->update($storyData);

    // Handle character updates
    if (isset($validated['characters']) && is_array($validated['characters'])) {
      foreach ($validated['characters'] as $characterData) {
        // If it's a new character, create it
        if (isset($characterData['is_new']) && $characterData['is_new']) {
          $story->characters()->create([
            'name' => $characterData['name'],
            'description' => $characterData['description'] ?? '',
          ]);
        }
      }
    }

    // Update existing characters
    if (isset($validated['character_updates']) && is_array($validated['character_updates'])) {
      foreach ($validated['character_updates'] as $id => $updates) {
        $character = $story->characters()->find($id);
        if ($character) {
          $character->update($updates);
        }
      }
    }

    // Delete characters
    if (isset($validated['character_deletes']) && is_array($validated['character_deletes'])) {
      foreach ($validated['character_deletes'] as $id) {
        $character = $story->characters()->find($id);
        if ($character) {
          $character->delete();
        }
      }
    }

    return redirect()->route('admin.community.index')
      ->with('success', 'Story updated successfully.');
  }

  /**
   * Remove the specified story from storage.
   */
  public function destroy(Story $story)
  {
    // Delete the cover image if it exists
    if ($story->cover_image) {
      Storage::disk('public')->delete($story->cover_image);
    }

    // Delete associated data (comments, likes, etc.)
    $story->comments()->delete();
    $story->likes()->delete();
    $story->drafts()->delete();
    $story->characters()->delete(); // Delete characters

    $story->delete();

    return redirect()->route('admin.community.index')
      ->with('success', 'Story deleted successfully.');
  }
}
