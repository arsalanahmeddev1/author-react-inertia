import React from 'react'
import Layout from '@/Layouts/Layout'
import aboutLeft from '../assets/images/about-left.png'
import aboutRight from '../assets/images/about-right.png'
import { Head } from '@inertiajs/react'
const About = () => {
  return (
    <Layout headerClass="inner-header">
      <Head title="About" />
      <main className="">
        <section className='about-sec-01 pt-200'>
          <div className="container">
          <h1 className="text-black text-center fs-70 fw-500 mb-80">About</h1>

            {/* Section 1 */}
            <div className="row align-items-center mb-100">
              <div className="col-lg-6 mb-4 mb-lg-0 d-flex justify-content-center">
                <img src={aboutLeft} alt="Team Image" className="img-fluid rounded shadow" style={{ maxWidth: '480px' }} />
              </div>
              <div className="col-lg-6">
                <h2 className="text-black fs-30 fw-600 mb-20">Craft Your Story, Choose Your Package</h2>
                <p className="mb-20">
                  Whether you're here to simply write, or you want to explore a more professional space for publishing and collaboration, we have a package to fit your needs.
                </p>
                <p>
                  From **community-driven packages** that allow you to collaborate with other writers, to **premium packages** with extra perks, we offer a variety of options for every storyteller.
                </p>
              </div>
            </div>
          </div>
        </section>
        <section className='about-sec-02'>
          <div className="container">
            <div className="row align-items-center flex-lg-row-reverse">
              <div className="col-lg-6 mb-4 mb-lg-0 d-flex justify-content-center">
                <img src={aboutRight} alt="Workspace Image" className="img-fluid rounded shadow" style={{ maxWidth: '480px' }} />
              </div>
              <div className="col-lg-6">
                <h2 className="text-white fs-30 fw-600 mb-20">
                  We believe great stories come from real people — not machines.
                  But sometimes, even the most creative minds need a little help.
                </h2>

                <p className="mb-20 text-white">
                  “You don't have to use AI. But if you're like me — someone who struggles to write well, or who’s tried to draw or paint (I’ve tried!) — then consider AI as a tool.
                  Not to write the entire story, but to spark inspiration. To help with grammar. To gently guide your ideas into focus.”
                </p>
                <blockquote className="fs-20 fw-600 text-white mb-10">— A fellow storyteller</blockquote>
                <p className="fs-18 text-white">
                  <strong>AI doesn’t replace your creativity — it supports it.</strong><br />
                  This is your space. Your voice.<br />
                  And the journey is just unfolding.
                </p>
              </div>
            </div>
          </div>
        </section>
      </main>
    </Layout>
  )
}

export default About
