import React, { useState } from 'react';
import Layout from '@/Layouts/Layout';
import { Head } from '@inertiajs/react';
import { Icons } from '@/utils/icons';
import { packagesData } from '@/utils/statics';
import { useStripe, useElements, CardElement, Elements } from '@stripe/react-stripe-js';
import { loadStripe } from '@stripe/stripe-js';
import CheckoutForm from '@/Components/CheckoutForm';  // Import CheckoutForm here
const stripePromise = loadStripe(import.meta.env.VITE_STRIPE_KEY);

const Packages = () => {
  const [selectedPackageId, setSelectedPackageId] = useState(null);

  return (
    <Layout headerClass="inner-header">
      <Head title="Packages" />
      <section className="pt-200 pb-100 sec-bg">
        <div className="container">
          <div className="row text-center">
            <div className="col-12" data-aos-duration="3000" data-aos="fade-down">
              <span className="fs-32 light-black ls-8">Explore</span>
              <h2 className="heading mb-10"> <span className="">Packages</span></h2>
              <h5 className="secondry-font fs-30 light-black mb-20">Stories Written by Our Community</h5>
              <p className="fs-20 mb-30">
                Discover unique continuations and interpretations of our stories, written by fellow community members.
                Find inspiration, enjoy creative twists, and see how others have expanded on our original tales.
              </p>
            </div>
          </div>
        </div>
      </section>
      <section className='sec-bg pb-100'>
        <div className="container">
          <div className="row row-gap-20 justify-content-center">
            {packagesData.map((packageItem) => (
              <div key={packageItem.id} className="col-md-4">
                <div className="publish-card package-card">
                  {/* Package Badge */}
                  <div className="package-badge">
                    {packageItem.badge}
                  </div>

                  {/* Package Icon */}
                  <div className='package-icon'>
                    <Icons.Premium className='fs-30 text-white' />
                  </div>

                  {/* Package Title */}
                  <h2 className="hd-md mb-20 package-title">
                    {packageItem.title}
                  </h2>

                  {/* Price */}
                  <div className="mb-30">
                    <span className="package-price">{packageItem.price} {packageItem.monthlyAnualy ? <span className='monthly-anualy'>/ {packageItem.monthlyAnualy}</span> : ''}</span>
                  </div>

                  {/* Features List */}
                  <div className="mb-40 package-features">
                    {packageItem.features.map((feature, index) => (
                      <div key={index} className="package-feature-item">
                        <div className={`feature-check-icon ${feature.isNegative ? 'feature-cross-icon' : ''}`}>
                          {feature.isNegative ? (
                            <Icons.Cross className="text-white" />
                          ) : (
                            <svg width="12" height="12" viewBox="0 0 24 24" fill="white">
                              <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                            </svg>
                          )}
                        </div>
                        <span className="para-mid feature-text">
                          {feature.text}
                        </span>
                      </div>
                    ))}
                  </div>

                  {/* CTA Button */}
                  <div className="d-grid">
                    <button
                      className="btn btn-primary btn-lg package-cta-button"
                      onClick={() => setSelectedPackageId(packageItem.id)}
                    >
                      {packageItem.ctaText}
                    </button>
                  </div>

                  {/* Money Back Guarantee */}
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {selectedPackageId && (
        <Elements stripe={stripePromise}>
          <CheckoutForm packageId={selectedPackageId} />
        </Elements>
      )}
    </Layout>
  );
};

export default Packages;
