import { Link } from '@inertiajs/react';

const Footer = () => {
  return (
    <footer className="footer">
      <div className="container">
        <div className="row justify-content-between" data-aos-duration="3000" data-aos="fade-down">
          <div className="col-md-3">
            <img src="/assets/images/logo.png" alt="logo" />
          </div>
          <div className="col-md-2">
            <h4 className="heading fs-48 text-white">Quick <span>Links</span></h4>
            <ul className="secondary-nav d-flex flex-column row-gap-30 justify-content-between pt-30">
              <li><Link href="/">home</Link></li>
              <li><Link href="/stories">Stories</Link></li>
              <li><Link href="/publish">Publish</Link></li>
              <li><Link href="/about">About Us</Link></li>
            </ul>
          </div>
          <div className="col-md-2">
            <h4 className="heading fs-48 text-white">Other <span>Links</span></h4>
            <ul className="secondary-nav d-flex flex-column row-gap-30 justify-content-between pt-30">
              <li><Link href="/faqs">FAQ's</Link></li>
              <li><Link href="/terms">Terms & Conditions</Link></li>
              <li><Link href="/privacy">Privacy Policy</Link></li>
            </ul>
          </div>
          <div className="col-md-4">
            <h4 className="heading fs-48 text-white mb-20">Subscribe To Our <span>Newsletter</span></h4>
            <form action="">
              <div className="field-wrapper position-relative">
                <input type="text" className="input-field" placeholder="Enter Your Email Address" />
                <button className="submit-btn position-absolute translate-middle-y top-50 end-0">
                  <img src="/assets/images/send.svg" alt="send" />
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div className="footer-bottom bg-primary-theme py-20 mt-70 text-center">
        <p className="text-white fs-20">© {new Date().getFullYear()} Author Website | All rights reserved</p>
      </div>
    </footer>
  );
};

export default Footer;
