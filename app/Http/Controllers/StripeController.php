<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Stripe\Stripe;
use Stripe\Checkout\Session;

class StripeController extends Controller
{
    public function createCheckoutSession(Request $request)
    {
        try {
            // Ensure user is authenticated
            $user = Auth::user();
            if (!$user) {
                return response()->json(['error' => 'User not authenticated'], 401);
            }

            Stripe::setApiKey(config('services.stripe.secret'));

            $domain = env('APP_URL');
            $packageName = $request->input('package_name', 'Default Package');
            $amount = $request->input('amount', 1900);
            $packagePriceId = $request->input('stripe_price_id');
            
            if (!$packagePriceId) {
                return response()->json(['error' => 'Stripe Price ID missing'], 422);
            }

            $session = Session::create([
                'payment_method_types' => ['card'],
                'mode' => 'subscription',
                'customer_email' => $user->email,
                'line_items' => [[
                    'price'    => $packagePriceId,   // recurring price id (not unit_amount)
                    'quantity' => 1,
                ]],
                'success_url' => $domain . '/stripe/success?session_id={CHECKOUT_SESSION_ID}',
                'cancel_url' => $domain . '/stripe/cancel',
            ]);

            return response()->json(['id' => $session->id]);
            
        } catch (\Exception $e) {
            Log::error('Error creating checkout session: ' . $e->getMessage());
            return response()->json(['error' => 'Failed to create checkout session: ' . $e->getMessage()], 500);
        }
    }

    public function success(Request $request)
    {
        $sessionId = $request->query('session_id');
        
        try {
            Stripe::setApiKey(config('services.stripe.secret'));
            
            // Retrieve the checkout session to get subscription details
            $session = \Stripe\Checkout\Session::retrieve($sessionId);
            
            if ($session->payment_status === 'paid' && $session->subscription) {
                $user = Auth::user();
                
                // Get the subscription details from Stripe
                $subscription = \Stripe\Subscription::retrieve($session->subscription);
                
                // Create or update the local subscription record
                \App\Models\Subscription::updateOrCreate(
                    ['stripe_id' => $subscription->id],
                    [
                        'user_id' => $user->id,
                        'type' => 'stripe',
                        'stripe_status' => $subscription->status,
                        'stripe_price' => $subscription->items->data[0]->price->id,
                        'quantity' => $subscription->quantity ?? 1,
                        'trial_ends_at' => $subscription->trial_end ? now()->addSeconds($subscription->trial_end - time()) : null,
                        'ends_at' => $subscription->cancel_at ? now()->addSeconds($subscription->cancel_at - time()) : null,
                    ]
                );
                
                // Update user with Stripe customer ID if not set
                if (!$user->stripe_customer_id && $subscription->customer) {
                    $user->update(['stripe_customer_id' => $subscription->customer]);
                }
                
                Log::info('Subscription created successfully for user ' . $user->id . ' with status: ' . $subscription->status);
                
                return redirect()->route('packages')->with('success', 'Subscription activated successfully! You can now use all features.');
            }
            
            return redirect()->route('packages')->with('error', 'Payment verification failed.');
            
        } catch (\Exception $e) {
            Log::error('Error processing successful payment: ' . $e->getMessage());
            return redirect()->route('packages')->with('error', 'Error processing payment: ' . $e->getMessage());
        }
    }

    public function cancel()
    {
        return "Payment Cancelled!";
    }
}
