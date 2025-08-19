import React, { useState, useEffect } from "react";
import Layout from "@/Layouts/Layout";
import { Head, usePage, router } from "@inertiajs/react";
import { Icons } from "@/utils/icons";
import {
    useStripe,
    useElements,
    CardElement,
    Elements,
} from "@stripe/react-stripe-js";
import { loadStripe } from "@stripe/stripe-js";
import CheckoutForm from "@/Components/CheckoutForm";

const stripePromise = loadStripe(import.meta.env.VITE_STRIPE_KEY);

const Packages = ({ packages = [] }) => {
    const { auth } = usePage().props;
    const [selectedPackageId, setSelectedPackageId] = useState(null);
    const [showModal, setShowModal] = useState(false);
    const [selectedPaymentMethod, setSelectedPaymentMethod] = useState("card");
    const [isAuthLoading, setIsAuthLoading] = useState(false);

    // Check if user just registered and should be redirected back to packages
    useEffect(() => {
        if (auth.user && auth.user.id) {
            const intendedPackageId = sessionStorage.getItem('intendedPackageId');
            if (intendedPackageId) {
                // Clear the stored package ID
                sessionStorage.removeItem('intendedPackageId');
                // Set loading state to prevent premature interactions
                setIsAuthLoading(true);
                // Add a small delay to ensure authentication state is fully loaded
                setTimeout(() => {
                    // Double-check that user is still authenticated before opening modal
                    if (auth.user && auth.user.id) {
                        // Automatically open the modal for the intended package
                        setSelectedPackageId(parseInt(intendedPackageId));
                        setShowModal(true);
                    }
                    setIsAuthLoading(false);
                }, 100);
            }
        }
    }, [auth.user]);

    // Check if there's a retry package after CSRF token refresh
    useEffect(() => {
        if (auth.user && auth.user.id) {
            const retryPackage = sessionStorage.getItem('retryPackage');
            if (retryPackage) {
                try {
                    const packageData = JSON.parse(retryPackage);
                    sessionStorage.removeItem('retryPackage');
                    // Automatically open the modal for the retry package
                    setSelectedPackageId(packageData.id);
                    setShowModal(true);
                } catch (error) {
                    console.error('Error parsing retry package:', error);
                    sessionStorage.removeItem('retryPackage');
                }
            }
        }
    }, [auth.user]);

    const handleCheckoutRedirect = async (pkg) => {
        // Debug: Log authentication state
        console.log('Checkout attempt - Auth state:', auth.user);
        
        try {
          // Get CSRF token from meta tag
          let csrfToken = document.querySelector('meta[name="csrf-token"]')?.getAttribute("content");
          if (!csrfToken) {
            // Try to get from window object (fallback)
            csrfToken = window.csrfToken;
            if (!csrfToken) {
              alert("CSRF token not found. Please refresh the page and try again.");
              return;
            }
          }

          const response = await fetch("/stripe/checkout", {
            method: "POST",
            credentials: "same-origin",
            headers: {
              "Content-Type": "application/json",
              "X-CSRF-TOKEN": csrfToken,
              "Accept": "application/json",
            },
            body: JSON.stringify({
              package_name: pkg.name,
              amount: pkg.price_cents,
              stripe_price_id: pkg.stripe_price_id,
            }),
          });
      
          // Debug: Log response details
          console.log('Response status:', response.status);
          console.log('Response headers:', Object.fromEntries(response.headers.entries()));
          
          // Check for different response statuses
          if (response.status === 401) {
            // User is not authenticated, redirect to login
            alert("Please log in to continue with your subscription.");
            router.visit(route('login'));
            return;
          }
          
          if (response.status === 419) {
            // CSRF token mismatch or session expired
            alert("Your session has expired. The page will refresh automatically to fix this issue.");
            // Store the package info to retry after refresh
            sessionStorage.setItem('retryPackage', JSON.stringify(pkg));
            setTimeout(() => window.location.reload(), 1000);
            return;
          }
          
          if (response.status === 422) {
            // Validation error
            const errorData = await response.json();
            alert("Validation error: " + (errorData.message || "Please check your input."));
            return;
          }
          
          if (response.status === 403) {
            // Forbidden - user might not have permission
            alert("Access denied. Please check your account permissions.");
            return;
          }
          
          if (!response.ok) {
            // Other HTTP errors
            console.error('HTTP Error:', response.status, response.statusText);
            alert(`Server error: ${response.status} ${response.statusText}`);
            return;
          }
      
              const data = await response.json();
          if (data.id) {
            const stripe = await stripePromise;
            stripe.redirectToCheckout({ sessionId: data.id });
          } else {
            alert("Something went wrong: " + (data.error || "Unknown error"));
          }
        } catch (error) {
          console.error("Checkout error:", error);
          if (error.name === 'SyntaxError') {
            alert("Server returned invalid response. Please refresh the page and try again.");
            window.location.reload();
          } else {
            alert("Checkout failed: " + error.message);
          }
        }
      };     


    const handleGetStarted = (packageId) => {
        // Check if user is authenticated
        if (!auth.user) {
            // Store the intended package ID in session storage to redirect back after registration
            sessionStorage.setItem('intendedPackageId', packageId);
            // Redirect to register page
            router.visit(route('register'));
            return;
        }
        
        // User is authenticated, proceed with normal flow
        setSelectedPackageId(packageId);
        setShowModal(true);
    };

    const closeModal = () => {
        setShowModal(false);
        setSelectedPackageId(null);
        setSelectedPaymentMethod("card");
    };

    const PaymentModal = () => {
        if (!showModal || !selectedPackageId || !auth.user) return null;

        const selectedPackage = packages.find(
            (pkg) => pkg.id === selectedPackageId,
        );

        const handleOverlayClick = (e) => {
            if (e.target === e.currentTarget) {
                closeModal();
            }
        };

        return (
            <div
                className="modal-overlay"
                style={modalOverlayStyle}
                onClick={handleOverlayClick}
                role="dialog"
                aria-modal="true"
                aria-labelledby="modal-title"
            >
                <div className="modal-content" style={modalContentStyle}>
                    <div className="modal-header" style={modalHeaderStyle}>
                        <h3 id="modal-title">Complete Your Subscription</h3>
                        <button
                            onClick={closeModal}
                            style={closeButtonStyle}
                            className="close-button"
                            aria-label="Close modal"
                        >
                            ×
                        </button>
                    </div>

                    <div className="modal-body" style={modalBodyStyle}>
                        {/* Package Summary */}
                        <div
                            className="package-summary"
                            style={packageSummaryStyle}
                        >
                            <h4>{selectedPackage?.name}</h4>
                            <p className="price">
                                {selectedPackage?.price_cents
                                    ? `$${(selectedPackage.price_cents / 100).toFixed(2)}`
                                    : "Free"}
                                {selectedPackage?.interval &&
                                    ` / ${selectedPackage.interval}`}
                            </p>
                        </div>

                        {/* Payment Method Selection */}
                        <div
                            className="payment-methods"
                            style={paymentMethodsStyle}
                        >
                            <h5
                                style={{
                                    marginBottom: "16px",
                                    color: "#495057",
                                }}
                            >
                                Choose Payment Method
                            </h5>

                            <div
                                className="payment-option"
                                style={{
                                    ...paymentOptionStyle,
                                    borderColor:
                                        selectedPaymentMethod === "card"
                                            ? "#007bff"
                                            : "#e9ecef",
                                    backgroundColor:
                                        selectedPaymentMethod === "card"
                                            ? "#f8f9ff"
                                            : "white",
                                }}
                                onClick={() => setSelectedPaymentMethod("card")}
                            >
                                <input
                                    type="radio"
                                    id="card"
                                    name="paymentMethod"
                                    value="card"
                                    checked={selectedPaymentMethod === "card"}
                                    onChange={(e) =>
                                        setSelectedPaymentMethod(e.target.value)
                                    }
                                    style={{ margin: 0 }}
                                />
                                <label htmlFor="card" style={paymentLabelStyle}>
                                    <Icons.CreditCard
                                        style={paymentIconStyle}
                                    />
                                    Stripe Payment
                                </label>
                            </div>

                            <div
                                className="payment-option"
                                style={{
                                    ...paymentOptionStyle,
                                    borderColor:
                                        selectedPaymentMethod === "paypal"
                                            ? "#007bff"
                                            : "#e9ecef",
                                    backgroundColor:
                                        selectedPaymentMethod === "paypal"
                                            ? "#f8f9ff"
                                            : "white",
                                }}
                                onClick={() =>
                                    setSelectedPaymentMethod("paypal")
                                }
                            >
                                <input
                                    type="radio"
                                    id="paypal"
                                    name="paymentMethod"
                                    value="paypal"
                                    checked={selectedPaymentMethod === "paypal"}
                                    onChange={(e) =>
                                        setSelectedPaymentMethod(e.target.value)
                                    }
                                    style={{ margin: 0 }}
                                />
                                <label
                                    htmlFor="paypal"
                                    style={paymentLabelStyle}
                                >
                                    <Icons.PayPal style={paymentIconStyle} />
                                    PayPal
                                </label>
                            </div>


                        </div>

                        {/* Payment Form */}
                        {/* {selectedPaymentMethod === 'card' && (
              <div className="payment-form">
                <Elements stripe={stripePromise}>
                  <CheckoutForm packageId={selectedPackageId} onSuccess={closeModal} />
                </Elements>
              </div>
            )} */}
                        {selectedPaymentMethod === "card" && (
                            <button
                                className="btn btn-primary w-100"
                                onClick={() => handleCheckoutRedirect(selectedPackage)}
                                disabled={isAuthLoading || !auth.user || !auth.user.id}
                            >
                                {isAuthLoading ? (
                                    <>
                                        <i className="fas fa-spinner fa-spin me-2"></i>
                                        Loading...
                                    </>
                                ) : !auth.user || !auth.user.id ? (
                                    "Authentication Required"
                                ) : (
                                    "Proceed to Stripe"
                                )}
                            </button>
                        )}

                        {selectedPaymentMethod === "paypal" && (
                            <div
                                className="payment-form"
                                style={paymentFormStyle}
                            >
                                <p className="mb-10">
                                    PayPal will be available soon.
                                </p>
                                <button className="btn btn-secondary" disabled>
                                    Coming Soon
                                </button>
                            </div>
                        )}

                        {selectedPaymentMethod === "bank" && (
                            <div
                                className="payment-form"
                                style={paymentFormStyle}
                            >
                                <p>
                                    Bank transfer details will be sent to your
                                    email.
                                </p>
                                <button className="btn btn-secondary" disabled>
                                    Coming Soon
                                </button>
                            </div>
                        )}
                    </div>
                </div>
            </div>
        );
    };

    // Transform database packages to match the expected format
    const transformedPackages = (packages || []).map((pkg, index) => {
        // Determine badge based on price
        let badge = "Free";
        if (pkg.price_cents > 0) {
            if (pkg.price_cents >= 1900) badge = "Pro";
            else if (pkg.price_cents >= 3800) badge = "Premium";
            else badge = "Standard";
        }

        // Create features array from database features
        const features =
            pkg.features && Array.isArray(pkg.features)
                ? pkg.features.map((feature) => ({
                    text: feature,
                    isNegative: false,
                }))
                : [];

        // Add default features if none exist
        if (features.length === 0) {
            if (pkg.price_cents === 0) {
                features.push(
                    {
                        text: "Can read all published stories.",
                        isNegative: false,
                    },
                    {
                        text: "Cannot write, publish, or contribute to stories.",
                        isNegative: true,
                    },
                    { text: "Cannot read community stories", isNegative: true },
                    {
                        text: "Do not need to login login as a guest account",
                        isNegative: false,
                    },
                );
            } else {
                features.push(
                    { text: "Premium features included", isNegative: false },
                    { text: "Full access to all stories", isNegative: false },
                    { text: "Community story access", isNegative: false },
                );
            }
        }

        return {
            id: pkg.id,
            badge: badge,
            title: pkg.name,
            price: pkg.price_cents
                ? `$${(pkg.price_cents / 100).toFixed(2)}`
                : "$0",
            monthlyAnualy: pkg.interval || null,
            words_limit: pkg.words_limit || 0,
            stories_limit: pkg.stories_limit || 0,
            icon: "Premium",
            features: features,
            ctaText: "Get Started Now",
            ctaLink: "/register",
            isPopular: index === 1 || index === 2, // Make 2nd and 3rd packages popular
        };
    });

    return (
        <Layout headerClass="inner-header">
            <Head title="Packages" />

            {/* Modal Styles */}
            <style>
                {`
          @keyframes modalSlideIn {
            from {
              opacity: 0;
              transform: translateY(-20px) scale(0.95);
            }
            to {
              opacity: 1;
              transform: translateY(0) scale(1);
            }
          }

          .payment-option:hover {
            border-color: #007bff !important;
            background-color: #f8f9ff !important;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.15);
          }
          
          .payment-option {
            transition: all 0.2s ease;
          }
          
          .close-button:hover {
            background-color: #e9ecef !important;
            color: #495057 !important;
          }
        `}
            </style>

            <section className="pt-200 pb-100 sec-bg">
                <div className="container">
                    <div className="row text-center">
                        <div
                            className="col-12"
                            data-aos-duration="3000"
                            data-aos="fade-down"
                        >
                            <span className="fs-32 light-black ls-8">
                                Explore
                            </span>
                            <h2 className="heading mb-10">
                                {" "}
                                <span className="">Packages</span>
                            </h2>
                            <h5 className="secondry-font fs-30 light-black mb-20">
                                Stories Written by Our Community
                            </h5>
                            <p className="fs-20 mb-30">
                                Discover unique continuations and
                                interpretations of our stories, written by
                                fellow community members. Find inspiration,
                                enjoy creative twists, and see how others have
                                expanded on our original tales.
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <section className="sec-bg pb-100">
                <div className="container">
                    <div className="row row-gap-20 justify-content-center">
                        {transformedPackages.length > 0 ? (
                            transformedPackages.map((packageItem) => (
                                <div key={packageItem.id} className="col-md-4">
                                    <div className="publish-card package-card">
                                        {/* Package Badge */}
                                        <div className="package-badge">
                                            {packageItem.badge}
                                        </div>

                                        {/* Package Icon */}
                                        <div className="package-icon">
                                            <Icons.Premium className="fs-30 text-white" />
                                        </div>

                                        {/* Package Title */}
                                        <h2 className="hd-md mb-20 package-title">
                                            {packageItem.title}
                                        </h2>

                                        {/* Price */}
                                        <div className="mb-30">
                                            <span className="package-price">
                                                {packageItem.price}{" "}
                                                {packageItem.monthlyAnualy ? (
                                                    <span className="monthly-anualy">
                                                        /{" "}
                                                        {
                                                            packageItem.monthlyAnualy
                                                        }
                                                    </span>
                                                ) : (
                                                    ""
                                                )}
                                            </span>
                                        </div>

                                        {/* Features List */}
                                        <div className="mb-40 package-features">
                                            <div className="package-feature-item">
                                                {
                                                    packageItem.words_limit > 0 ? (
                                                        <div className={`feature-check-icon`}>
                                                            <svg
                                                                width="12"
                                                                height="12"
                                                                viewBox="0 0 24 24"
                                                                fill="white"
                                                            >
                                                                <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                                                            </svg>
                                                        </div>

                                                    ) : (
                                                        ""
                                                    )
                                                }
                                                <span className="para-mid feature-text">
                                                {
                                                    packageItem.words_limit > 0 ? (
                                                        <>
                                                        can write {packageItem.words_limit} words per day
                                                        </>
                                                    ) : (
                                                        ""
                                                    )
                                                }
                                                </span>
                                            </div>
                                            <div className="package-feature-item">
                                                {
                                                    packageItem.stories_limit > 0 ? (
                                                        <div className={`feature-check-icon`}>
                                                            <svg
                                                                width="12"
                                                                height="12"
                                                                viewBox="0 0 24 24"
                                                                fill="white"
                                                            >
                                                                <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                                                            </svg>
                                                        </div>

                                                    ) : (
                                                        ""
                                                    )
                                                }
                                                <span className="para-mid feature-text">
                                                {   
                                                    packageItem.stories_limit > 0 ? (
                                                        <>
                                                        Can Post {packageItem.stories_limit} stories per month
                                                        </>
                                                    ) : (
                                                        ""
                                                    )
                                                }
                                                </span>
                                            </div>
                                            {packageItem.features.map(
                                                (feature, index) => (
                                                    <div
                                                        key={index}
                                                        className="package-feature-item"
                                                    >
                                                        <div
                                                            className={`feature-check-icon ${feature.isNegative ? "feature-cross-icon" : ""}`}
                                                        >
                                                            {feature.isNegative ? (
                                                                <Icons.Cross className="text-white" />
                                                            ) : (
                                                                <svg
                                                                    width="12"
                                                                    height="12"
                                                                    viewBox="0 0 24 24"
                                                                    fill="white"
                                                                >
                                                                    <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                                                                </svg>
                                                            )}
                                                        </div>
                                                        <span className="para-mid feature-text">
                                                            {feature.text}
                                                        </span>
                                                    </div>
                                                ),
                                            )}
                                        </div>

                                        {/* CTA Button */}
                                        <div className="d-grid">
                                            <button
                                                className="btn btn-primary btn-lg package-cta-button"
                                                onClick={() =>
                                                    handleGetStarted(
                                                        packageItem.id,
                                                    )
                                                }
                                            >
                                                {packageItem.ctaText}
                                            </button>
                                        </div>

                                        {/* Money Back Guarantee */}
                                    </div>
                                </div>
                            ))
                        ) : (
                            <div className="col-12 text-center">
                                <p className="fs-20 text-muted">
                                    No packages available at the moment.
                                </p>
                            </div>
                        )}
                    </div>
                </div>
            </section>

            {/* Payment Modal */}
            <PaymentModal />
        </Layout>
    );
};

// Modal Styles
const modalOverlayStyle = {
    position: "fixed",
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    backgroundColor: "rgba(0, 0, 0, 0.6)",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    zIndex: 1000,
    backdropFilter: "blur(2px)",
};

const modalContentStyle = {
    backgroundColor: "white",
    borderRadius: "12px",
    width: "90%",
    maxWidth: "550px",
    maxHeight: "90vh",
    overflow: "auto",
    boxShadow: "0 10px 40px rgba(0, 0, 0, 0.3)",
    animation: "modalSlideIn 0.3s ease-out",
};

const modalHeaderStyle = {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    padding: "24px 24px 20px 24px",
    borderBottom: "1px solid #e1e5e9",
    backgroundColor: "#f8f9fa",
    borderTopLeftRadius: "12px",
    borderTopRightRadius: "12px",
};

const closeButtonStyle = {
    background: "none",
    border: "none",
    fontSize: "28px",
    cursor: "pointer",
    color: "#6c757d",
    width: "32px",
    height: "32px",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    borderRadius: "50%",
    transition: "all 0.2s ease",
    ":hover": {
        backgroundColor: "#e9ecef",
        color: "#495057",
    },
};

const modalBodyStyle = {
    padding: "24px",
};

const packageSummaryStyle = {
    textAlign: "center",
    marginBottom: "24px",
    padding: "20px",
    backgroundColor: "#f8f9fa",
    borderRadius: "8px",
    border: "1px solid #e9ecef",
};

const paymentMethodsStyle = {
    marginBottom: "24px",
};

const paymentOptionStyle = {
    display: "flex",
    alignItems: "center",
    marginBottom: "12px",
    padding: "16px",
    border: "2px solid #e9ecef",
    borderRadius: "8px",
    cursor: "pointer",
    transition: "all 0.2s ease",
    ":hover": {
        borderColor: "#007bff",
        backgroundColor: "#f8f9ff",
    },
};

const paymentLabelStyle = {
    display: "flex",
    alignItems: "center",
    marginLeft: "12px",
    cursor: "pointer",
    flex: 1,
    fontSize: "16px",
    fontWeight: "500",
    color: "#495057",
};

const paymentIconStyle = {
    marginRight: "12px",
    width: "24px",
    height: "24px",
    color: "#6c757d",
};

const paymentFormStyle = {
    textAlign: "center",
    padding: "24px",
    backgroundColor: "#f8f9fa",
    borderRadius: "8px",
    border: "1px solid #e9ecef",
};

export default Packages;
