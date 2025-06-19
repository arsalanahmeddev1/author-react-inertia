import React from 'react'
import Button from '../Components/common/Button'
import Layout from '@/Layouts/Layout'
import { Link } from '@inertiajs/react'
import StoryOfTheMonth from '@/Components/StoryOfTheMonth'
import Testimonials from '@/Components/Testimonials'
const Home = () => {


  return (
    <Layout headerClass="pt-30">
      <section className='hero-banner overflow-hidden z-2'>
        <div className="container-xxl">
          <div className="d-flex justify-content-center align-items-center flex-column">
            <h1 className='hd-lg mb-20 text-center text-white'>Where Every Story Leaves a Mark</h1>
            <p className='para-dark mb-20 text-center'>
              Join our creative community. Explore, interact, and create your own version of timeless tales.
            </p>
            <div className="d-flex gap-20 mb-20">
              <Button className="btn btn-primary">Continue Story At Your Own Way</Button>
              <Button className="btn btn-secondary">View Stories</Button>
            </div>
          </div>
          <div className="d-flex align-items-center justify-content-center position-relative">
            <div className="image-center-container image-container position-relative z-1">
              <div className="image-left-container position-absolute image-container-xxl">
                <img src="/assets/images/banner-card-01.png" alt="banner-image" />
              </div>
              <img src="/assets/images/banner-card-02.png" className='hero-banner-center-img' alt="banner-image" />
              <div className="image-right-container position-absolute image-container-xxl">
                <img src="/assets/images/banner-card-03.png" alt="banner-image" />
              </div>
            </div>
          </div>
        </div>
      </section>
      <section className='fearured-stories'>
        <div className="container-xxl">
          <div className="row row-gap-40">
            <div className="col-lg-6">
              <h2 className='hd-lg mb-40 text-center text-lg-start'>Featured Stories</h2>
              <div className="fearured-stories-card">
                <div className="row justify-content-center row-gap-40">
                  <div className="col-lg-4 col-md-6 fearured-stories-card-inner">
                    <img src="/assets/images/featured-01.png" className='mb-10 fsc-image' alt="featured-stories-card-01" />
                    <h6 className='text-sm text-uppercase text-center' >Death at Fallow End</h6>
                  </div>
                  <div className="col-lg-4 col-md-6 fearured-stories-card-inner">
                    <img src="/assets/images/featured-02.png" className='mb-10 fsc-image' alt="featured-stories-card-02 " />
                    <h6 className='text-sm text-uppercase text-center'>Death at Fallow End</h6>

                  </div>
                  <div className="col-lg-4 col-md-6 fearured-stories-card-inner">
                    <img src="/assets/images/featured-03.png" className='mb-10 fsc-image' alt="featured-stories-card-03" />
                    <h6 className='text-sm text-uppercase text-center'>Death at Fallow End</h6>
                  </div>
                </div>
              </div>
            </div>
            <div className="col-lg-6">
              <div className="mt-20 text-center text-lg-start">
                <h2 className='hd-md text-uppercase'>Death at Fallow End</h2>
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
      <section className="signin-bg position-relative">
        <div className="container-xxl">
          <img src="/assets/images/signin-book.png" alt="signin-book" className='signin-book position-absolute'/>
          <img src="/assets/images/signin-right.png" alt="signin-right" className='signin-right position-absolute bottom-0 end-0' />
          <div className="row text-center text-lg-start">
            <div className="col-lg-7">
              <h2 className='hd-md mb-20 text-white' style={{ maxWidth: "770px" }}>Sign In to Continue Crafting the Story Your Way</h2>
              <p className='text-white mb-20' style={{ maxWidth: "840px" }}>
                Take the reins and let your imagination run wild! Log in to pick up where the story left off or create your own twists and turns. Your words, your world—continue the adventure as you see fit.
              </p>
              <div className="d-flex gap-20 justify-content-center justify-content-lg-start">
                <Button className="btn btn-primary">Sign In</Button>
                <Button className="btn btn-secondary">Read A Sample</Button>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section className='collection-sec'>
        <div className="container-xxl">
            <h2 className='hd-md mb-20 mb-70 uppercase text-center' style={{ fontWeight: "400" }}>Our Collection</h2>
          <div className="row justify-content-center row-gap-40">
            <div className="col-lg-6 col-xl-4 col-md-6">
              <div className="collection-card d-flex justify-content-center align-items-center gap-20" >
                <div className="collection-card-img" >
                  <img src="/assets/images/collection-01.png" alt="collection-01" />
                </div>
                <div>
                  <h4 className='text-30-bold mb-10' style={{ maxWidth: "195px" }}>Death At Fallow End</h4>
                  <span className="text-primary secondary-font text-20 ">Anne Rice</span>
                  <p className='text-black secondary-font mb-20 mt-10'>
                    95 People Read This Story
                  </p>
                  <Button className='btn btn-primary text-white'>Story Detail</Button>

                </div>
              </div>
            </div>
            <div className="col-lg-6 col-xl-4 col-md-6">
              <div className="collection-card d-flex justify-content-center align-items-center gap-20" >
                <div className="collection-card-img" >
                  <img src="/assets/images/collection-02.png" alt="collection-01" />
                </div>
                <div>
                  <h4 className='text-30-bold mb-10' style={{ maxWidth: "195px" }}>Death At Fallow End</h4>
                  <span className="text-primary secondary-font text-20 ">Victoria Saccenti</span>
                  <p className='text-black secondary-font mb-20 mt-10'>
                  62 People Read This Story
                  </p>
                  <Button className='btn btn-primary text-white'>Story Detail</Button>

                </div>
              </div>
            </div>
            <div className="col-lg-6 col-xl-4 col-md-6">
              <div className="collection-card d-flex justify-content-center align-items-center gap-20" >
                <div className="collection-card-img" >
                  <img src="/assets/images/collection-03.png" alt="collection-01" />
                </div>
                <div>
                  <h4 className='text-30-bold mb-10' style={{ maxWidth: "195px" }}>Death At Fallow End</h4>
                  <span className="text-primary secondary-font text-20 ">Martha Grimes</span>
                  <p className='text-black secondary-font mb-20 mt-10'>
                  36 People Read This Story
                  </p>
                  <Button className='btn btn-primary text-white'>Story Detail</Button>

                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <StoryOfTheMonth />
      <Testimonials />
    </Layout>
  )
}



export default Home
