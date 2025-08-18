<?php

namespace App\Http\Controllers;

use App\Models\Package;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Stripe\Stripe;
use Stripe\Customer;
use Stripe\Subscription;
use App\Models\Subscription as LocalSubscription;


class SubscriptionController extends Controller
{
    public function subscribe(Request $request, Package $package)
    {
        try {
            Stripe::setApiKey(env('STRIPE_SECRET'));
            
            $user = $request->user();
            $paymentMethod = $request->input('payment_method');

            // Create or get Stripe customer
            $customer = $this->getOrCreateStripeCustomer($user);

            // Attach payment method to customer
            $this->attachPaymentMethodToCustomer($paymentMethod, $customer->id);

            // Create subscription
            $subscription = Subscription::create([
                'customer' => $customer->id,
                'items' => [['price' => $package->stripe_price_id]],
                'default_payment_method' => $paymentMethod,
                'expand' => ['latest_invoice.payment_intent'],
            ]);

            // Update user with subscription info
            $user->update([
                'stripe_customer_id' => $customer->id,
                'stripe_subscription_id' => $subscription->id,
            ]);

            LocalSubscription::create([
                'user_id' => $user->id,
                'type' => 'stripe',
                'stripe_id' => $subscription->id,
                'stripe_status' => $subscription->status,
                'stripe_price' => $package->stripe_price_id,
                'quantity' => $subscription->quantity ?? 1,
                'trial_ends_at' => $subscription->trial_end ? now()->addSeconds($subscription->trial_end - time()) : null,
                'ends_at' => $subscription->cancel_at ? now()->addSeconds($subscription->cancel_at - time()) : null,
            ]);

            // Log the subscription creation for debugging
            Log::info('Subscription created for user ' . $user->id . ' with status: ' . $subscription->status);

            return response()->json(['success' => true, 'subscription_id' => $subscription->id]);
            
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 400);
        }
    }

    private function getOrCreateStripeCustomer($user)
    {
        if ($user->stripe_customer_id) {
            return Customer::retrieve($user->stripe_customer_id);
        }

        $customer = Customer::create([
            'email' => $user->email,
            'name' => $user->name,
            'metadata' => [
                'user_id' => $user->id,
            ],
        ]);

        $user->update(['stripe_customer_id' => $customer->id]);
        
        return $customer;
    }

    private function attachPaymentMethodToCustomer($paymentMethod, $customerId)
    {
        $paymentMethodObj = \Stripe\PaymentMethod::retrieve($paymentMethod);
        $paymentMethodObj->attach(['customer' => $customerId]);
    }

    public function success()
    {
        return inertia('Subscription/Success'); // React/Inertia page for confirmation
    }

    
}
