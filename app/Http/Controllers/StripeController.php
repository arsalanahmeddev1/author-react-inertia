<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Checkout\Session;

class StripeController extends Controller
{
    public function createCheckoutSession(Request $request)
    {
        Stripe::setApiKey(config('services.stripe.secret'));

        $domain = env('APP_URL');
        $packageName = $request->input('package_name', 'Default Package');
        $amount = $request->input('amount', 1900);

        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => [[
                'price_data' => [
                    'currency' => 'usd',
                    'product_data' => [
                        'name' => $packageName,
                    ],
                    'unit_amount' => $amount,
                ],
                'quantity' => 1,
            ]],
            'mode' => 'payment',
            'success_url' => $domain . '/stripe/success?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => $domain . '/stripe/cancel',
        ]);

        return response()->json(['url' => $session->url]);
    }

    public function success(Request $request)
    {
        $sessionId = $request->query('session_id');
        return "Payment Successful! Session ID: " . $sessionId;
    }

    public function cancel()
    {
        return "Payment Cancelled!";
    }
}