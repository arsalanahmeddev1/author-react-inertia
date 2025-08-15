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

        // Event type handle karo
        switch ($event->type) {
            case 'invoice.payment_succeeded':
                $invoice = $event->data->object;
                Log::info('Payment succeeded: ' . $invoice->id);
                break;

            case 'customer.subscription.created':
                $subscription = $event->data->object;
                Log::info('Subscription created: ' . $subscription->id);
                break;

            // aur jo events chahiye wo handle kar sakte ho
        }

        return response('Webhook Handled', 200);
    }
}
