import React from 'react';
import { Head } from '@inertiajs/react';
import InnerLayout from '@/Layouts/InnerLayout';
import AOS from 'aos';
import { useEffect } from 'react';

export default function Publish() {
    useEffect(() => {
        AOS.init({
            duration: 800,
            once: true,
        });
    }, []);

    return (
        <InnerLayout>
            <Head title="Publish Your Story" />

            {/* Hero Section */}
            <section className="py-100 bg-light">
                <div className="container">
                    <div className="row align-items-center">
                        <div className="col-lg-8 mx-auto text-center">
                            <div className="mb-4" data-aos="fade-up">
                                <img
                                    src="/assets/images/publish-icon.svg"
                                    alt="Publish Icon"
                                    className="mb-3 mx-auto"
                                    style={{ width: '80px', height: '80px' }}
                                />
                                <h1 className="display-4 fw-bold primary-font">Publish</h1>
                            </div>
                            <h2 className="fs-1 mb-4 secondry-font" data-aos="fade-up" data-aos-delay="100">
                                Create and Grow Your Story Universe
                            </h2>
                            <div className="divider mx-auto mb-5" data-aos="fade-up" data-aos-delay="200"></div>
                            <p className=" mb-5 secondry-font" data-aos="fade-up" data-aos-delay="300" style={{fontSize: '25px'}}>
                                Turn your story into an immersive multimedia experience. Engage new audiences,
                                expand your reach, and maximize your earnings.
                            </p>
                            <a
                                href="#"
                                className="btn btn-primary btn-lg px-5 py-3 fs-5 secondry-font"
                                data-aos="fade-up"
                                data-aos-delay="400"
                            >
                                Join Our Waitlist
                            </a>
                            <p className="mt-4 text-muted secondry-font" data-aos="fade-up" data-aos-delay="500" style={{fontSize: '25px'}}>
                                Push the boundaries of storytelling. Create richer, more immersive stories,
                                connect with a global network of creators and fans, and unlock the full
                                potential of your creativity.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* Step 1 */}
            <section className="py-100">
                <div className="container">
                    <div className="row align-items-center">
                        <div className="col-lg-6 mb-5 mb-lg-0" data-aos="fade-right">
                            <img
                                src="assets/images/publish-1-begin-story.webp"
                                alt="Start Your Story"
                                className="img-fluid rounded-4 shadow-lg"
                            />
                        </div>
                        <div className="col-lg-5 offset-lg-1" data-aos="fade-left">
                            <h2 className="mb-4 primary-font" style={{fontSize: '35px'}}>
                                <span className="text-primary-theme">1.</span> Start Your Story
                            </h2>
                            <p className="secondry-font" style={{fontSize: '25px'}}>
                                Transform your ideas into a multimedia story using our Co/Script tool.
                                Seamlessly add elements like artwork, music, performances, and more
                                using our network of creators or generative AI to help bring your story to life.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* Step 2 */}
            <section className="py-100 bg-light">
                <div className="container">
                    <div className="row align-items-center">
                        <div className="col-lg-5 mb-5 mb-lg-0 order-lg-1 order-2" data-aos="fade-left">
                            <h2 className=" mb-4 primary-font" style={{fontSize: '35px'}}>
                                <span className="text-primary-theme">2.</span> Collaborate with Other Artists
                            </h2>
                            <p className=" secondry-font" style={{fontSize: '25px'}}>
                                Don't let limited skills hold back your incredible story. Our platform connects
                                you with a vibrant community of writers, artists, musicians, designers, and
                                performers. Find the perfect collaborators to elevate your story through our
                                collaboration program.
                            </p>
                        </div>
                        <div className="col-lg-6 offset-lg-1 order-lg-2 order-1" data-aos="fade-right">
                            <img
                                src="/assets/images/publish-2-collaborate.webp"
                                alt="Collaborate with Other Artists"
                                className="img-fluid rounded-4 shadow-lg"
                            />
                        </div>
                    </div>
                </div>
            </section>

            {/* Step 3 */}
            <section className="py-100">
                <div className="container">
                    <div className="row align-items-center">
                        <div className="col-lg-6 mb-5 mb-lg-0" data-aos="fade-right">
                            <img
                                src="/assets/images/publish-3-build-audience.webp"
                                alt="Build Your Audience"
                                className="img-fluid rounded-4 shadow-lg"
                            />
                        </div>
                        <div className="col-lg-5 offset-lg-1" data-aos="fade-left">
                            <h2 className="mb-4 primary-font" style={{fontSize: '35px'}}>
                                <span className="text-primary-theme">3.</span> Build Your Audience
                            </h2>
                            <p className="secondry-font" style={{fontSize: '25px'}}>
                                Harness the power of our platform to find and grow your audience.
                                Utilize our tools to share your story with the world on popular social media,
                                webcomic, and podcasting platforms and build a dedicated following.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* Step 4 */}
            <section className="py-100 bg-light">
                <div className="container">
                    <div className="row align-items-center">
                        <div className="col-lg-5 mb-5 mb-lg-0 order-lg-1 order-2" data-aos="fade-left">
                            <h2 className="mb-4 primary-font" style={{fontSize: '35px'}}>
                                <span className="text-primary-theme">4.</span> Engage Your Super Fans
                            </h2>
                            <p className="secondry-font" style={{fontSize: '25px'}}>
                                Engage with your audience in new ways by involving them in the creative process.
                                Let your fans influence, guide, and expand your story universe, creating a
                                deeper connection.
                            </p>
                        </div>
                        <div className="col-lg-6 offset-lg-1 order-lg-2 order-1" data-aos="fade-right">
                            <img
                                src="/assets/images/publish-4-engage-fans.webp"
                                alt="Engage Your Super Fans"
                                className="img-fluid rounded-4 shadow-lg"
                            />
                        </div>
                    </div>
                </div>
            </section>

            {/* Step 5 */}
            <section className="py-100">
                <div className="container">
                    <div className="row align-items-center">
                        <div className="col-lg-6 mb-5 mb-lg-0" data-aos="fade-right">
                            <img
                                src="/assets/images/publish-5-maximize-earnings.webp"
                                alt="Maximize Your Earnings"
                                className="img-fluid rounded-4 shadow-lg"
                            />
                        </div>
                        <div className="col-lg-5 offset-lg-1" data-aos="fade-left">
                            <h2 className="mb-4 primary-font" style={{fontSize: '35px'}}>
                                <span className="text-primary-theme">5.</span> Maximize Your Earnings
                            </h2>
                            <p className="secondry-font" style={{fontSize: '25px'}}>
                                Unlock multiple revenue streams. Our platform provides you with the tools
                                and resources to monetize your story effectively, from subscriptions and
                                ad revenue to merchandise and licensing opportunities.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* CTA Section */}
            <section className="py-100 bg-primary-theme text-white">
                <div className="container">
                    <div className="row">
                        <div className="col-lg-8 mx-auto text-center">
                            <h2 className="mb-4 primary-font" style={{fontSize: '35px'}} data-aos="fade-up">Ready to Start Your Publishing Journey?</h2>
                            <p className="mb-5 secondry-font text-white" style={{fontSize: '25px'}} data-aos="fade-up" data-aos-delay="100">
                                Join our platform today and transform your storytelling experience.
                            </p>
                            <a
                                href="#"
                                className="btn btn-secondary"
                                data-aos="fade-up"
                                data-aos-delay="200"
                            >
                                Join Our Waitlist
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </InnerLayout>
    );
}
