import React from 'react'
import Layout from '@/Layouts/Layout'
import { Head } from '@inertiajs/react'
import Button from '@/Components/common/Button'
import { Icons } from '@/utils/icons'
import { Link } from '@inertiajs/react'

const Packages = ({ story }) => {
  return (
    <Layout headerClass="inner-header">
      <Head title="Packages" />
      <section className="py-200 sec-bg">
        <div className="container-xxl">
          <div className="d-flex justify-content-center align-items-center flex-column pb-100">
            <h1 className="heading mb-10">Choose Your <span>Story Journey</span></h1>
            <p className="fs-20 mb-30">
              Unlock the full potential of your storytelling with our premium package designed for passionate writers and readers.
            </p>
          </div>
        </div>
        <div className="container-xxl">
          <div className="row justify-content-center">
            <div className="col-lg-8 col-xl-6">
              {/* Package Card */}
              <div className="publish-card" style={{
                background: 'linear-gradient(145deg, #ffffff 0%, #f8f9fa 100%)',
                border: '2px solid #e9ecef',
                borderRadius: '20px',
                padding: '50px 40px',
                textAlign: 'center',
                position: 'relative',
                overflow: 'hidden',
                boxShadow: '0 20px 40px rgba(0, 0, 0, 0.1)',
                transition: 'all 0.3s ease'
              }}>
                {/* Premium Badge */}
                <div style={{
                  position: 'absolute',
                  top: '20px',
                  right: '20px',
                  background: 'linear-gradient(45deg, #fea257, #ff8c42)',
                  color: 'white',
                  padding: '8px 16px',
                  borderRadius: '20px',
                  fontSize: '14px',
                  fontWeight: '600',
                  textTransform: 'uppercase',
                  letterSpacing: '1px'
                }}>
                  Premium
                </div>

                {/* Package Icon */}
                <div style={{
                  width: '80px',
                  height: '80px',
                  background: 'linear-gradient(135deg, #fea257 0%, #ff8c42 100%)',
                  borderRadius: '50%',
                  display: 'flex',
                  alignItems: 'center',
                  justifyContent: 'center',
                  margin: '0 auto 30px auto',
                  boxShadow: '0 10px 25px rgba(254, 162, 87, 0.3)'
                }}>
                  <Icons.Premium className='fs-30 text-white' />
                </div>

                {/* Package Title */}
                <h2 className="hd-md mb-20" style={{ color: '#202020' }}>
                  Story Vault Premium
                </h2>

                {/* Price */}
                <div className="mb-30">
                  <span style={{
                    fontSize: '48px',
                    fontWeight: '700',
                    color: '#fea257'
                  }}>$19</span>
                  <span style={{
                    fontSize: '18px',
                    color: '#6b6b6b',
                    marginLeft: '8px'
                  }}>/month</span>
                </div>

                {/* Features List */}
                <div className="mb-40" style={{ textAlign: 'left' }}>
                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    marginBottom: '20px',
                    padding: '0 20px'
                  }}>
                    <div style={{
                      width: '24px',
                      height: '24px',
                      background: '#fea257',
                      borderRadius: '50%',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      marginRight: '15px',
                      flexShrink: 0
                    }}>
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="white">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                      </svg>
                    </div>
                    <span className="para-mid" style={{ fontSize: '16px' }}>
                      Unlimited story creation and publishing
                    </span>
                  </div>

                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    marginBottom: '20px',
                    padding: '0 20px'
                  }}>
                    <div style={{
                      width: '24px',
                      height: '24px',
                      background: '#fea257',
                      borderRadius: '50%',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      marginRight: '15px',
                      flexShrink: 0
                    }}>
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="white">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                      </svg>
                    </div>
                    <span className="para-mid" style={{ fontSize: '16px' }}>
                      Advanced character development tools
                    </span>
                  </div>

                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    marginBottom: '20px',
                    padding: '0 20px'
                  }}>
                    <div style={{
                      width: '24px',
                      height: '24px',
                      background: '#fea257',
                      borderRadius: '50%',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      marginRight: '15px',
                      flexShrink: 0
                    }}>
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="white">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                      </svg>
                    </div>
                    <span className="para-mid" style={{ fontSize: '16px' }}>
                      Priority community story approval
                    </span>
                  </div>

                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    marginBottom: '20px',
                    padding: '0 20px'
                  }}>
                    <div style={{
                      width: '24px',
                      height: '24px',
                      background: '#fea257',
                      borderRadius: '50%',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      marginRight: '15px',
                      flexShrink: 0
                    }}>
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="white">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                      </svg>
                    </div>
                    <span className="para-mid" style={{ fontSize: '16px' }}>
                      Exclusive writing workshops and tips
                    </span>
                  </div>

                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    marginBottom: '20px',
                    padding: '0 20px'
                  }}>
                    <div style={{
                      width: '24px',
                      height: '24px',
                      background: '#fea257',
                      borderRadius: '50%',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      marginRight: '15px',
                      flexShrink: 0
                    }}>
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="white">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                      </svg>
                    </div>
                    <span className="para-mid" style={{ fontSize: '16px' }}>
                      Advanced analytics and reader insights
                    </span>
                  </div>

                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    padding: '0 20px'
                  }}>
                    <div style={{
                      width: '24px',
                      height: '24px',
                      background: '#fea257',
                      borderRadius: '50%',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      marginRight: '15px',
                      flexShrink: 0
                    }}>
                      <svg width="12" height="12" viewBox="0 0 24 24" fill="white">
                        <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41z" />
                      </svg>
                    </div>
                    <span className="para-mid" style={{ fontSize: '16px' }}>
                      24/7 priority customer support
                    </span>
                  </div>
                </div>

                {/* CTA Button */}
                <div className="d-grid">
                  {story?.id ? (
                    <Link href={route('stories.publish.form', { story: story.id })}
                      className="btn btn-primary btn-lg"
                      style={{
                        background: 'linear-gradient(45deg, #fea257, #ff8c42)',
                        border: 'none',
                        borderRadius: '12px',
                        padding: '15px 40px',
                        fontSize: '18px',
                        fontWeight: '600',
                        textTransform: 'uppercase',
                        letterSpacing: '1px',
                        transition: 'all 0.3s ease',
                        boxShadow: '0 8px 25px rgba(254, 162, 87, 0.3)'
                      }}
                    >
                      Get Started Now
                    </Link> 
                  ): (
                      <button className="btn btn-secondary btn-lg" disabled>
                        Loading...
                      </button>)}
                </div>

                {/* Money Back Guarantee */}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Additional Info Section */}
      <section className="py-100" style={{ backgroundColor: '#202020' }}>
        <div className="container-xxl">
          <div className="row justify-content-center text-center">
            <div className="col-lg-8">
              <h3 className="hd-md mb-30 text-white">
                Ready to Transform Your Storytelling?
              </h3>
              <p className="para-mid mb-40" style={{ color: '#e0e0e0' }}>
                Join thousands of writers who have already elevated their craft with Story Vault Premium.
                Start your journey today and unlock the full potential of your creative voice.
              </p>
              <div className="d-flex gap-20 justify-content-center">
                <Button className="btn btn-primary">Start Free Trial</Button>
                <Button className="btn btn-secondary">Learn More</Button>
              </div>
            </div>
          </div>
        </div>
      </section>
    </Layout>
  )
}

export default Packages