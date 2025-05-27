import React from 'react'
import Button from '../Components/common/Button'
import Layout from '@/Layouts/Layout'
import { Link } from '@inertiajs/react'
const Home = () => {
  return (
    <Layout>
      <section className='hero-banner overflow-hidden z-2'>
        <div className="container">
          <div className="d-flex justify-content-center align-items-center flex-column">
            <h1 className='hd-lg mb-20 text-white'>Where Every Story Leaves a Mark</h1>
            <p className='para-dark mb-20 '>
              Join our creative community. Explore, interact, and create your own version of timeless tales.
            </p>
            <div className="d-flex gap-20 mb-20">
              <Button className="btn btn-primary">Continue Story At Your Own Way</Button>
              <Button className="btn btn-secondary">View Stories</Button>
            </div>
          </div>
          <div className="d-flex align-items-center justify-content-center position-relative">
            <div className="image-left-container image-container">
              <img src="/assets/images/banner-card-01.png" alt="banner-image" />
            </div>
            <div className="image-center-container image-container">
              <img src="/assets/images/banner-card-02.png" alt="banner-image" />
            </div>
            <div className="image-right-container image-container">
              <img src="/assets/images/banner-card-03.png" alt="banner-image" />
            </div>
          </div>
        </div>
      </section>
      <section className='fearured-stories'>
        <div className="container">
          <div className="row">
            <div className="col-lg-6">
              <h2 className='hd-lg mb-40'>Featured Stories</h2>
              <div className="fearured-stories-card">
                <div className="row">
                  <div className="col-lg-4">
                    <img src="/assets/images/featured-01.png" className='mb-10' alt="featured-stories-card-01" />
                    <span className='text-sm text-uppercase' >Death at Fallow End</span>
                  </div>
                  <div className="col-lg-4">
                    <img src="/assets/images/featured-02.png" className='mb-10' alt="featured-stories-card-02" />
                    <span className='text-sm text-uppercase'>Death at Fallow End</span>

                  </div>
                  <div className="col-lg-4">
                    <img src="/assets/images/featured-03.png" className='mb-10' alt="featured-stories-card-03" />
                    <span className='text-sm text-uppercase'>Death at Fallow End</span>
                  </div>
                </div>
              </div>
            </div>
            <div className="col-lg-6">
              <div className="mt-20">
                <h2 className='hd-md text-uppercase '>Death at Fallow End</h2>
                <h4 className='text-primary font-medium featured-sub-title secondry-font mb-20'>Fallow End had the perfume of rot beneath roses.</h4>
                <p className='para-mid mb-30'>
                  It masqueraded as a village of perfect English serenity—an illusion spun from moss-draped eaves, honeyed stone walls, and the gentle sigh of hedgerows whispering against flaking garden gates. But if one stayed still long enough in its meadows, one would hear it: the creak of something ancient refusing to die, and the hush of secrets wound tight as ivy around the bones of Halverton House.
                </p>
                <p className='para-mid mb-20'>
                  The Earl of Halverton, Crispin Forsythe, last of his line, had once been beautiful in the way marble statues are beautiful—cold, aloof, untouched by sweat or consequence. But that was a long time ago. Now, he was a man crumbling under the weight of heritage and debt, inviting strangers to drink champagne in his ancestral gallery while the floorboards moaned beneath them like weary ghosts.
                </p>
                <Link href="/" className='btn btn-primary text-white'>Read More</Link>
              </div>
            </div>
          </div>
        </div>
      </section>
    </Layout>
  )
}



export default Home
