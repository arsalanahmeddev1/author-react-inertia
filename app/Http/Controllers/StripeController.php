<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Payment;
use Illuminate\Support\Facades\Auth;

use Stripe\Stripe;
use Stripe\Checkout\Session;
use Stripe\PaymentIntent;

class StripeController extends Controller
{
    public function createCheckoutSession(Request $request)
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => 'usd',
                    'product_data' => [
                        'name' => 'Story Publishing Package',
                    ],
                    'unit_amount' => 19 * 100,
                ],
                'quantity' => 1,
            ]],
            'mode' => 'payment',
            'success_url' => route('stripe.success') . '?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => route('stripe.cancel'),
        ]);

        return response()->json(['id' => $session->id]);
    }

    public function createPaymentIntent(Request $request)
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        $intent = PaymentIntent::create([
            'amount' => 19 * 100,
            'currency' => 'usd',
            'metadata' => [
                'user_id' => Auth::id(),
                'description' => 'Story Publishing Package',
            ],
        ]);

        return response()->json([
            'clientSecret' => $intent->client_secret,
        ]);
    }

    public function success(Request $request)
    {
        return Inertia::render('Stories/Publish/Success');
    }

    public function cancel()
    {
        return redirect()->route('stories.index')->with('error', 'Payment was cancelled.');
    }

    /**
     * Webhook to handle Stripe events
     */
    public function webhook(Request $request)
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        $payload = $request->getContent();
        $sig_header = $request->header('Stripe-Signature');
        $endpoint_secret = env('STRIPE_WEBHOOK_SECRET');

        try {
            $event = \Stripe\Webhook::constructEvent(
                $payload, $sig_header, $endpoint_secret
            );
        } catch(\UnexpectedValueException $e) {
            return response()->json(['error' => 'Invalid payload'], 400);
        } catch(\Stripe\Exception\SignatureVerificationException $e) {
            return response()->json(['error' => 'Invalid signature'], 400);
        }

        // Handle the event
        switch ($event->type) {
            case 'payment_intent.succeeded':
                $paymentIntent = $event->data->object;
                $this->handlePaymentSucceeded($paymentIntent);
                break;
            case 'payment_intent.payment_failed':
                $paymentIntent = $event->data->object;
                $this->handlePaymentFailed($paymentIntent);
                break;
            default:
                echo 'Received unknown event type ' . $event->type;
        }

        return response()->json(['status' => 'success']);
    }

    private function handlePaymentSucceeded($paymentIntent)
    {
        Payment::create([
            'user_id' => $paymentIntent->metadata->user_id ?? null,
            'stripe_payment_intent_id' => $paymentIntent->id,
            'amount' => $paymentIntent->amount / 100, // Convert from cents
            'currency' => $paymentIntent->currency,
            'status' => $paymentIntent->status,
            'payment_method' => $paymentIntent->payment_method,
            'description' => $paymentIntent->metadata->description ?? 'Story Publishing Package',
        ]);
    }

    private function handlePaymentFailed($paymentIntent)
    {
        Payment::create([
            'user_id' => $paymentIntent->metadata->user_id ?? null,
            'stripe_payment_intent_id' => $paymentIntent->id,
            'amount' => $paymentIntent->amount / 100,
            'currency' => $paymentIntent->currency,
            'status' => $paymentIntent->status,
            'payment_method' => $paymentIntent->payment_method,
            'description' => $paymentIntent->metadata->description ?? 'Story Publishing Package',
        ]);
    }
}
