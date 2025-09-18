import React from 'react'
import Layout from '@/Layouts/Layout'
import { Head } from '@inertiajs/react'
import { Icons } from '@/utils/icons'
import { howItWorksData } from '@/utils/statics'
import Faqs from '@/Components/Faqs'

const HowItWorks = () => {
    return (
        <Layout headerClass="inner-header">
            <Head title="How It Works" />
            <main className='pt-200'>
                <div className="container">
                    <h1 className='text-black text-center fs-70 fw-500 mb-80'>How It Works</h1>
                </div>
                <section className='hiw-sec-01'>
                    <div className="container">
                        <div className="row justify-content-center text-center row-gap-60">
                            {howItWorksData.map((item) => {
                                const Icon = Icons[item.icon];
                                return (
                                    <div className="col-lg-4 col-md-6" key={item.id}>
                                        <div className="hiw-sec-01-card d-flex flex-column align-items-center">
                                            <div className="hiw-step-card-icon mb-20">
                                                <Icon size={30} />
                                            </div>
                                            <div className="hiw-step-card-content">
                                                <h3 className="hiw-step-card-title text-black fs-25 fw-600 mb-10">{item.title}</h3>
                                                <p className="hiw-step-card-description fs-16">{item.description}</p>
                                            </div>
                                        </div>
                                    </div>
                                );
                            })}
                        </div>
                    </div>
                </section>
                <section className='faq-sec py-100'>
                    <div className="container">
                        <Faqs
                            title="Faqs"
                            faqs={[
                                {
                                    question: "How do I get started with Storie Vault?",
                                    answer: "Just create a free account to begin your storytelling journey."
                                },
                                {
                                    question: "Can I rewrite existing stories?",
                                    answer: "Yes! Browse our story library, pick one you like, and reimagine it in your own style or genre."
                                },
                                {
                                    question: "Where do I write my story?",
                                    answer: "Use our built-in editor to write, customize, and format your story easily."
                                },
                                {
                                    question: "Can I choose who sees my story?",
                                    answer: "Yes. You can publish your story publicly or keep it private within the Storie Vault community."
                                },
                                {
                                    question: "How do I share my story with others?",
                                    answer: "After publishing, you'll get a shareable link. Send it to friends, readers, or post it online."
                                },
                                {
                                    question: "Can I get feedback on my writing?",
                                    answer: "Definitely. Other users can read your story and leave feedback to help you grow as a writer."
                                },
                                {
                                    question: "Can my story be published outside the Storie Vault?",
                                    answer: "Yes. We can help you distribute your work to global platforms like Amazon, Barnes & Noble, and HarperCollins."
                                },
                            ]}
                        />

                    </div>
                </section>
            </main>
        </Layout>
    )
}

export default HowItWorks