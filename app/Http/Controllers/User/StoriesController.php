<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Story;
use Illuminate\Http\Request;
use Inertia\Inertia;

class StoriesController extends Controller
{
    public function index()
    {
        $query = Story::where('user_id', auth()->id());
        $stories = $query->orderByDesc('id')->paginate(10);
        // dd(auth()->id());
        // dd(Story::where('user_id', auth()->id())->get());
        dd(\App\Models\Story::where('user_id', 30)->get());
        return Inertia::render('user/stories/Index', [
            'stories' => $stories,
        ]);
    }
}
