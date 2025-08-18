<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Stripe\Stripe;
use Stripe\Webhook;
use Stripe\Exception\SignatureVerificationException;

class StripeWebhookController extends Controller
{
    public function handle(Request $request)
    {
        $payload = $request->getContent();
        $sigHeader = $request->header('Stripe-Signature');

        $endpointSecret = env('STRIPE_WEBHOOK_SECRET');

        try {
            $event = \Stripe\Webhook::constructEvent(
                $payload, $sigHeader, $endpointSecret
            );
        } catch (\UnexpectedValueException $e) {
            // Invalid payload
            return response('', 400);
        } catch (SignatureVerificationException $e) {
            // Invalid signature
            return response('', 400);
        }

        // Handle different event types
        switch ($event->type) {
            case 'invoice.payment_succeeded':
                $invoice = $event->data->object;
                Log::info('Payment succeeded: ' . $invoice->id);
                
                // Update subscription status to active when payment succeeds
                if ($invoice->subscription) {
                    $localSubscription = \App\Models\Subscription::where('stripe_id', $invoice->subscription)->first();
                    if ($localSubscription) {
                        $localSubscription->update(['stripe_status' => 'active']);
                        Log::info('Subscription status updated to active: ' . $invoice->subscription);
                    }
                }
                break;

            case 'customer.subscription.created':
                $subscription = $event->data->object;
                Log::info('Subscription created: ' . $subscription->id);
                
                // Update subscription status when created
                $localSubscription = \App\Models\Subscription::where('stripe_id', $subscription->id)->first();
                if ($localSubscription) {
                    $localSubscription->update(['stripe_status' => $subscription->status]);
                    Log::info('Subscription status updated: ' . $subscription->id . ' to ' . $subscription->status);
                }
                break;

            case 'customer.subscription.updated':
                $subscription = $event->data->object;
                Log::info('Subscription updated: ' . $subscription->id);
                
                // Update subscription status when updated
                $localSubscription = \App\Models\Subscription::where('stripe_id', $subscription->id)->first();
                if ($localSubscription) {
                    $localSubscription->update(['stripe_status' => $subscription->status]);
                    Log::info('Subscription status updated: ' . $subscription->id . ' to ' . $subscription->status);
                }
                break;

            case 'customer.subscription.deleted':
                $subscription = $event->data->object;
                Log::info('Subscription deleted: ' . $subscription->id);
                
                // Update subscription status when deleted
                $localSubscription = \App\Models\Subscription::where('stripe_id', $subscription->id)->first();
                if ($localSubscription) {
                    $localSubscription->update(['stripe_status' => 'canceled']);
                    Log::info('Subscription status updated to canceled: ' . $subscription->id);
                }
                break;
        }

        return response('Webhook Handled', 200);
    }
}
