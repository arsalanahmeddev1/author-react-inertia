import React from 'react'
import Layout from '@/Layouts/Layout'
import aboutLeft from '../assets/images/about-left.png'
import aboutRight from '../assets/images/about-right.png'
// about page new changes
const About = () => {
  return (
    <Layout headerClass="inner-header">
      <main className="py-200">
        <div className="container">
          <h1 className="text-black text-center fs-40 fw-500 mb-80 secondry-font">About Us</h1>

          {/* Section 1 */}
          <div className="row align-items-center mb-100">
            <div className="col-lg-6 mb-4 mb-lg-0 d-flex justify-content-center">
              <img src={aboutLeft} alt="Team Image" className="img-fluid rounded shadow" style={{ maxWidth: '480px' }} />
            </div>
            <div className="col-lg-6">
              <h2 className="text-black fs-30 fw-600 mb-20 secondry-font">Where stories begin — and grow.</h2>
              <p className="mb-20">
                This isn’t a static platform — many things are coming down the line. We’re building a living space where writers of all levels can explore, create, and grow.
              </p>
              <p>
                This platform was born from a mind full of creativity and ideas — a passion for stories, characters, and worlds waiting to be written.
                And like many of you, I’ve often felt the ideas racing ahead while the words struggled to keep up.
              </p>
            </div>
          </div>

          {/* Section 2 */}
          <div className="row align-items-center flex-lg-row-reverse">
            <div className="col-lg-6 mb-4 mb-lg-0 d-flex justify-content-center">
              <img src={aboutRight} alt="Workspace Image" className="img-fluid rounded shadow" style={{ maxWidth: '480px' }} />
            </div>
            <div className="col-lg-6">
              <p className="mb-20">
                “You don't have to use AI. But if you're like me — someone who struggles to write well, or who’s tried to draw or paint (I’ve tried!) — then consider AI as a tool.
                Not to write the entire story, but to spark inspiration. To help with grammar. To gently guide your ideas into focus.”
              </p>
              <blockquote className="fs-20 fw-600 text-black mb-10 secondry-font">— A fellow storyteller</blockquote>
              <p className="fs-18">
                <strong>AI doesn’t replace your creativity — it supports it.</strong><br />
                This is your space. Your voice.<br />
                And the journey is just unfolding.
              </p>
            </div>
          </div>
        </div>
      </main>
    </Layout>
  )
}

export default About
