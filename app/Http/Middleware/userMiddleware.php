<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class userMiddleware
{
    public function handle(Request $request, Closure $next): Response
    {
        if(!auth()->check() || auth()->user()->group_id != '2') {
            abort(403, 'Unauthorized');
        }

        return $next($request);
    }
}
