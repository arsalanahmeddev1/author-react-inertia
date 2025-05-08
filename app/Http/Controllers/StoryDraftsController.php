<?php

namespace App\Http\Controllers;

use App\Models\Story;
use App\Models\StoryDraft;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class StoryDraftsController extends Controller
{
    /**
     * Get all drafts for the authenticated user.
     */
    public function index()
    {
        $user = Auth::user();
        $drafts = $user->storyDrafts()
            ->with(['story', 'character'])
            ->latest()
            ->get();
            
        return response()->json([
            'drafts' => $drafts
        ]);
    }
    
    /**
     * Store a new draft.
     */
    public function store(Request $request)
    {
        $user = Auth::user();
        
        $data = $request->validate([
            'story_id' => 'required|exists:stories,id',
            'character_id' => 'nullable|exists:characters,id',
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'html_content' => 'nullable|string',
            'word_count' => 'required|integer|min:0',
        ]);
        
        // Add user_id to the data
        $data['user_id'] = $user->id;
        
        // Create the draft
        $draft = StoryDraft::create($data);
        
        // Load the relationships
        $draft->load(['story', 'character']);
        
        return response()->json([
            'message' => 'Draft saved successfully',
            'draft' => $draft
        ]);
    }
    
    /**
     * Update an existing draft.
     */
    public function update(Request $request, StoryDraft $draft)
    {
        // Check if the user owns the draft
        if ($draft->user_id !== Auth::id()) {
            return response()->json([
                'message' => 'Unauthorized'
            ], 403);
        }
        
        $data = $request->validate([
            'character_id' => 'nullable|exists:characters,id',
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'html_content' => 'nullable|string',
            'word_count' => 'required|integer|min:0',
        ]);
        
        // Update the draft
        $draft->update($data);
        
        // Load the relationships
        $draft->load(['story', 'character']);
        
        return response()->json([
            'message' => 'Draft updated successfully',
            'draft' => $draft
        ]);
    }
    
    /**
     * Delete a draft.
     */
    public function destroy(StoryDraft $draft)
    {
        // Check if the user owns the draft
        if ($draft->user_id !== Auth::id()) {
            return response()->json([
                'message' => 'Unauthorized'
            ], 403);
        }
        
        // Delete the draft
        $draft->delete();
        
        return response()->json([
            'message' => 'Draft deleted successfully'
        ]);
    }
}
