import React, { useEffect, useState } from 'react';
import { CardElement, useStripe, useElements } from '@stripe/react-stripe-js';
import { router } from '@inertiajs/react';

const CheckoutForm = ({ packageId }) => {
    const [clientSecret, setClientSecret] = useState('');
    const stripe = useStripe();
    const elements = useElements();

    useEffect(() => {
        // Fetch the client secret from the backend for SetupIntent
        fetch('/billing', {
            method: 'GET',
        })
            .then((res) => res.json())
            .then((data) => setClientSecret(data.intent.client_secret));
    }, []);

    const handleSubmit = async (event) => {
        event.preventDefault();

        if (!stripe || !elements) return;

        const { error, paymentMethod } = await stripe.createPaymentMethod({
            type: 'card',
            card: elements.getElement(CardElement),
        });

        if (error) {
            console.error(error);
        } else {
            // Send paymentMethod and packageId to backend to complete subscription
            fetch(`/subscribe/${packageId}`, {
                method: 'POST',
                body: JSON.stringify({
                    payment_method: paymentMethod.id,
                }),
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                },
            })
                .then((response) => response.json())
                .then((data) => {
                    if (data.success) {
                        Inertia.visit('/subscription-success');
                    } else {
                        console.error(data.error);
                    }
                });
        }
    };

    const handleSubscriptionSubmit = async (e, packageId) => {
        e.preventDefault();
    
        if (!stripe || !elements) return;
    
        // Create Stripe token
        const {token, error} = await stripe.createToken(elements.getElement(CardElement));
    
        if (error) {
            console.error(error.message);
        } else {
            // Send payment method and packageId to backend to create subscription
            fetch(`/subscribe/${packageId}`, {
                method: 'POST',
                body: JSON.stringify({
                    payment_method: token.id,  // Ensure payment method is passed here
                }),
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                },
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Handle success (Redirect to success page or show success message)
                    router.visit('/subscription-success');
                } else {
                    console.error(data.error);
                }
            });
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <CardElement />
            <button type="submit" disabled={!stripe}>
                Subscribe
            </button>
        </form>
    );
};

export default CheckoutForm;
