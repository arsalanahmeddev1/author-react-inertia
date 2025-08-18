<?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Inertia\Middleware;
use Illuminate\Support\Facades\Auth;

class HandleInertiaRequests extends Middleware
{
    /**
     * The root template that is loaded on the first page visit.
     *
     * @var string
     */
    protected $rootView = 'app';

    /**
     * Determine the current asset version.
     */
    public function version(Request $request): ?string
    {
        return parent::version($request);
    }

    /**
     * Define the props that are shared by default.
     *
     * @return array<string, mixed>
     */
    public function share(Request $request): array
    {
        return [
            ...parent::share($request),
            'auth' => [
                'user' => $request->user() ? [
                    'id' => $request->user()->id,
                    'name' => $request->user()->name,
                    'email' => $request->user()->email,
                    'role' => Auth::user()->role,
                    'is_guest' => $request->user()->is_guest,
                    'is_active' => $request->user()->is_active,
                    'subscription' => $request->user()->subscription ? [
                        'id' => $request->user()->subscription->id,
                        'type' => $request->user()->subscription->type,
                        'stripe_id' => $request->user()->subscription->stripe_id,
                        'stripe_status' => $request->user()->subscription->stripe_status,
                        'stripe_price' => $request->user()->subscription->stripe_price,
                        'quantity' => $request->user()->subscription->quantity,
                        'trial_ends_at' => $request->user()->subscription->trial_ends_at,
                        'ends_at' => $request->user()->subscription->ends_at,
                    ] : null,
                ] : null,
            ],
        ];
    }
}
