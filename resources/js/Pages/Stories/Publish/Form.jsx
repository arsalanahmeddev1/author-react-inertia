import Layout from '@/Layouts/Layout'
import React, { useState, useEffect } from 'react';
import { Elements, CardElement, useStripe, useElements } from '@stripe/react-stripe-js';
import { loadStripe } from '@stripe/stripe-js';
import { Head, router } from '@inertiajs/react'
import TextInput from '@/Components/TextInput';

const stripePromise = loadStripe(import.meta.env.VITE_STRIPE_KEY);

const CheckoutForm = ({ story, character, storyText }) => {
  const stripe = useStripe();
  const elements = useElements();
  const [clientSecret, setClientSecret] = useState('');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    // Backend se client secret lo
    fetch('/stripe/payment-intent', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      },
    })
      .then(res => res.json())
      .then(data => setClientSecret(data.clientSecret));
  }, []);

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!stripe || !elements) return;

    setLoading(true);

    const result = await stripe.confirmCardPayment(clientSecret, {
      payment_method: {
        card: elements.getElement(CardElement),
      },
    });

    if (result.error) {
      alert(result.error.message);
      setLoading(false);
      return;
    }

    if (result.paymentIntent.status === 'succeeded') {
      // 1. Payment done
      // 2. Save data to backend using Inertia router
      router.post('/story/publish-request', {
        story_id: story.id,
        character: character,
        content: storyText,
        title: story.title,
        genre: story.genre,
      }, {
        onSuccess: () => {
          alert("Payment and publish request successful!");
          window.location.href = "/stories"; // ya success page
        },
        onError: (errors) => {
          alert("Payment done, but failed to save publish request!");
          console.error('Publish request errors:', errors);
        }
      });
    }

    setLoading(false);
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className="create-element-wrapper">
        <CardElement options={{ hidePostalCode: true }} />
      </div>
      <button type="submit" disabled={!stripe || loading} className="btn btn-primary mt-4">
        {loading ? 'Processing...' : 'Publish'}
      </button>
    </form >
  );
};

const Form = ({ prefill, story }) => {
  const [character, setCharacter] = useState('');
  const [storyText, setStoryText] = useState('');
  const [formData, setFormData] = useState({
    title: story.title || '',
    genre: story.genre || '',
    character: prefill.character_name || '',
    content: prefill.content || '',
  });
  useEffect(() => {
    if (prefill) {
      setCharacter(prefill.character_name || '');
      setStoryText(prefill.content || '');
    }
  }, [prefill]);

  return (
    <Elements stripe={stripePromise}>
      <Layout headerClass="inner-header">
        <Head title="Publish Form" />
        <section className="py-200 sec-bg">
          <div className="container-xxl">
            <div className="d-flex justify-content-center align-items-center flex-column pb-100">
              <h1 className="heading mb-10">Publish Your <span>Story</span></h1>
              <p className="fs-20 mb-30">
                Share your imagination with the world — publish your story
              </p>
            </div>
            <div className="col-8 mx-auto">
              <div className="row justify-content-center publish-form-wrapper">
                <div className="col-md-12">
                  <div className="field-wrapper">
                    <label className='label-field' htmlFor="title">Title</label>
                    <TextInput type="text" className="input-field" id="title" name="title" value={story.title} readOnly
                    // onChange={(e) => setFormData({ ...formData, title: e.target.value })}
                    />
                  </div>
                  <div className="field-wrapper">
                    <label className='label-field' htmlFor="title">Character</label>
                    <TextInput value={character} type="text" className="input-field" id="character" name="character" readOnly
                    // onChange={(e) => setFormData({ ...formData, character: e.target.value })}
                    />
                  </div>
                  <div className="field-wrapper">
                    <label className='label-field' htmlFor="title">Genre</label>
                    <TextInput type="text" className="input-field" id="title" value={story.genre} name="title" readOnly />
                  </div>
                  <div className="field-wrapper">
                    <label className='label-field' htmlFor="title">Description</label>
                    <textarea name="your_story" className="input-field textarea-field" value={storyText} id="your_story" readOnly></textarea>
                  </div>
                  <h4 className='pay-hd'>Pay With Stripe</h4>
                  <CheckoutForm
                    story={story}
                    character={character}
                    storyText={storyText}
                  />
                  {/* <button
                      type="button"
                      className="btn btn-primary story-btn secondry-font"
                    >
                      <i className="fas fa-paper-plane me-2"></i>
                      Publish & Pay
                    </button> */}
                </div>
              </div>
            </div>
          </div>
        </section>
      </Layout>
    </Elements>
  )
}

export default Form