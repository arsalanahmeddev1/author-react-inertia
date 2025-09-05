import React, { useRef } from 'react'
import Button from '../Components/common/Button'
import Layout from '@/Layouts/Layout'
import { Link, Head, usePage } from '@inertiajs/react'
import StoryOfTheMonth from '@/Components/StoryOfTheMonth'
import Testimonials from '@/Components/Testimonials';
import HeroBanner from '@/Components/home/HeroBanner'
import Slider from 'react-slick'
import { Icons } from '../utils/icons'


// Custom Arrows for Featured Stories
const PrevArrow = ({ onClick }) => (
  <div className="featured-arrow custom-prev" onClick={onClick}>
    <Icons.ArrowLeft />
  </div>
);

const NextArrow = ({ onClick }) => (
  <div className="featured-arrow custom-next" onClick={onClick}>
    <Icons.ArrowRight />
  </div>
);

const Home = () => {
  const { auth, latestStories, featuredStories } = usePage().props;
  const featuredSliderRef = useRef(null);

  // Featured Stories Slider Settings
  const featuredSliderSettings = {
    dots: true,
    arrows: false,
    infinite: true,
    speed: 600,
    slidesToShow: 3,
    slidesToScroll: 1,
    nextArrow: <NextArrow />,
    prevArrow: <PrevArrow />,
    // autoplay: true,
    autoplaySpeed: 2000,
    pauseOnDotsHover: false,
    customPaging: i => (
      <span className="dot-number">{i + 1}</span>
    ),
    appendDots: dots => (
      <div className="custom-dots">
        <ul className="featured-stories-dots">{dots}</ul>
      </div>
    ),
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 991,
        settings: {
          slidesToShow: 3,
        },
      },
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 575,
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  };


  return (
    <Layout headerClass="pt-30 home-page-wrapper" mainClass="home-page-wrapper">
      <Head title="Home" />
      <HeroBanner />
      <section className='fearured-stories'>
        <div className="container-xxl">
          <div className="row row-gap-40">
            <div className="col-lg-6">
              <h2 className='hd-lg fw-500 mb-40 text-center text-lg-start'>Featured Stories</h2>
              <div className="fearured-stories-card overflow-hidden">
                {featuredStories && featuredStories.length > 0 ? (
                  <>
                    <Slider ref={featuredSliderRef} {...featuredSliderSettings}>
                      {featuredStories.map((story, index) => (
                        <div key={story.id} className="fearured-stories-card-inner">
                          <Link href={`/stories/${story.id}`} className=' text-black'>
                            <img
                              src={story.cover_image ? `/storage/${story.cover_image}` : `/assets/images/featured-0${(index % 3) + 1}.png`}
                              className='mb-10 fsc-image'
                              alt={story.title}
                            />
                            <h6 className='text-sm text-uppercase mb-5'>{story.title}</h6>
                            <h6 className='fs-20 fw-400  mb-5' style={{ color: '#fea257' }}> <span className='text-black fw-500'>By</span> {story.author}</h6>
                            Read More
                          </Link>
                        </div>
                      ))}
                    </Slider>

                    {/* Custom Navigation Arrows */}
                    <div className="featured-custom-arrows mt-30 d-flex justify-content-start gap-20">
                      {/* <div className="prev-arrow" onClick={() => featuredSliderRef.current.slickPrev()}>
                        <Icons.ArrowLeft className="fs-30 text-black" />
                      </div>
                      <div className="next-arrow" onClick={() => featuredSliderRef.current.slickNext()}>
                        <Icons.ArrowRight className="fs-30 text-black" />
                      </div> */}
                    </div>
                  </>
                ) : (
                  <div className="col-12">
                    <p className="text-muted">No featured stories found. Be the first to share your story!</p>
                  </div>
                )}
              </div>
            </div>
            <div className="col-lg-6">
              <div className="mt-20 text-center text-lg-start">
                <h2 className='hd-md fw-700 mb-20 text-uppercase'>Death at Fallow End</h2>
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
          <img src="/assets/images/signin-book.png" alt="signin-book" className='signin-book position-absolute' />
          <img src="/assets/images/signin-right.png" alt="signin-right" className='signin-right position-absolute bottom-0 end-0' />
          <div className="row text-center text-lg-start">
            <div className="col-lg-7">
              <h2 className="hd-md mb-20 text-white" style={{ maxWidth: "770px" }}>
                {auth?.user ? (
                  <>
                    {auth.user.is_guest ? (
                      <>Welcome Guest! Craft your story in your own way.</>
                    ) : (
                      <>Welcome back, {auth.user.name}! Craft your story in your own way.</>
                    )}
                  </>
                ) : (
                  <>Sign In to Continue Crafting the Story Your Way</>
                )}
              </h2>

              <p className="text-white fw-400 mb-20" style={{ maxWidth: "840px" }}>
                Take the reins and let your imagination run wild! Log in to pick up where the story left off or create your own twists and turns. Your words, your world—continue the adventure as you see fit.
              </p>

              <div className="d-flex gap-20 justify-content-center justify-content-lg-start">
                {!auth?.user && (
                  <>
                    <Link href="/login" className="btn btn-primary">Sign In</Link>
                    <Link href="/stories" className="btn btn-secondary">Read A Sample</Link>
                  </>
                )}

                {auth?.user?.role === 'admin' && (
                  <a className="btn btn-secondary" href="/admin-dashboard/stories/create">
                    Write A New Story
                  </a>
                )}

                {auth?.user && auth?.user?.role !== 'admin' && (
                  <Link href="/stories" className="btn btn-secondary">Read A Sample</Link>
                )}
              </div>
              {/* <div className="d-flex gap-20 justify-content-center justify-content-lg-start">
                <Button className="btn btn-primary">Sign In</Button>
                <Button className="btn btn-secondary">Read A Sample</Button>
              </div> */}
            </div>
          </div>
        </div>
      </section>
      <section className='collection-sec'>
        <div className="container-xxl">
          <h2 className='hd-md fw-500 mb-70 uppercase text-center'>Our Collection</h2>
          <div className="row justify-content-center row-gap-40">
            {latestStories && latestStories.slice(0, 3).map((story, index) => (
              <div key={story.id} className="col-12 col-lg-12 col-xl-4">
                <div className="collection-card d-flex justify-content-center align-items-center gap-20" >
                  <div className="collection-card-img" >
                    <img
                      src={story.cover_image ? `/storage/${story.cover_image}` : `/assets/images/collection-0${index + 1}.png`}
                      alt={story.title}
                    />
                  </div>
                  <div className='collection-card-content'>
                    <h4 className='text-30-bold mb-10' style={{ maxWidth: "195px" }}>{story.title}</h4>
                    {/* {story.author && (
                      <span className="text-primary secondary-font text-20">{story.author}</span>
                    )} */}
                    <p className='text-black secondary-font mb-20 mt-10'>
                      {story.read_count === 0
                        ? 'No one has read this story'
                        : story.read_count === 1
                          ? '1 person has read this story'
                          : `${story.read_count} people have read this story`}
                    </p>
                    {/* {story.genre && (
                      <div className="mb-3">
                        <span className="label bg-secondry-theme text-white fs-16 py-10 px-20 radius-60 d-inline-block">
                          {story.genre}
                        </span>
                      </div>
                    )} */}
                    <Link href={`/stories/${story.id}`} className='btn btn-primary text-white'>Story Detail</Link>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
      <StoryOfTheMonth />
      <Testimonials />
    </Layout>
  )
}

Home.title = "Home";


export default Home
