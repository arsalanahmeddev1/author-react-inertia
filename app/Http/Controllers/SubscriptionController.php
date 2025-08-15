<?php

namespace App\Http\Controllers;

use App\Models\Package;
use Illuminate\Http\Request;

class SubscriptionController extends Controller
{
    public function subscribe(Request $request, Package $package)
    {
        $user = $request->user();

        // Ensure user has a payment method
        if (!$user->hasDefaultPaymentMethod()) {
            return response()->json(['error' => 'Please add a payment method first.'], 400);
        }

        $paymentMethod = $request->input('payment_method');

        // Create subscription in Stripe
        $user->newSubscription('default', $package->stripe_price_id)
        ->create($paymentMethod);

        return response()->json(['success' => true]);
    }

    public function success()
    {
        return inertia('Subscription/Success'); // React/Inertia page for confirmation
    }
}
