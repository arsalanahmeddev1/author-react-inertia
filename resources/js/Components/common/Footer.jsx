import { Link } from '@inertiajs/react';
import { Icons } from '../../utils/icons';
const Footer = () => {
  return (
    <footer className='footer'>
      <div className="container-xxl">
        <div className="footer-content">
          <div className="row justify-content-between row-gap-40">
            <div className="col-lg-2">
              <div className="logo mb-40">
                <img src="/assets/images/logo.png" alt="logo" />
              </div>
              <div className="footer-logos">
                <img src="/assets/images/dmc-icon.png" alt="dmc" />
                <img src="/assets/images/pci.png" alt="pci" />
              </div>
            </div>
            <div className="col-lg-2">
              <h4 className='fs-36 secondry-font text-primary fw-600 mb-10'>Quick Links</h4>
              <ul className='footer-nav secondry-font'>
                <li><Link href="/">Home</Link></li>
                <li><Link href="/stories">Stories</Link></li>
                <li><Link href="/community">Community</Link></li>
                <li><Link href="/publish">Publish</Link></li>
                <li><Link href="/about">About</Link></li>
              </ul>
            </div>
            <div className="col-lg-2">
              <h4 className='fs-36 secondry-font text-primary fw-600 mb-10'>Other links</h4>
              <ul className='footer-nav secondry-font'>
                <li><Link href="/">FAQ’s</Link></li>
                <li><Link href="/terms-and-conditions">Terms & Conditions</Link></li>
                <li><Link href="/privacy-policy">Privacy Policy</Link></li>
                <li><Link href="/community-guidelines">Community Guidelines</Link></li>
              </ul>
            </div>
            <div className="col-lg-4">
              <h4 className='fs-36 secondry-font footer-newsletter-hd text-white fw-500 mb-20'>Subscribe To Our Newsletter</h4>
              <form action="">
                <div className="field-wrapper position-relative">
                  <input type="text" className='input-field' placeholder='Enter Your Email  Address' />
                  <button type='submit' className='btn-primary position-absolute translate-middle-y top-50'><Icons.Send className='text-white fs-25' /></button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div className="bottom-bar">
        <p className='text-white fs-18 secondry-font text-center'>© 2025 Author Website | All rights reserved</p>
      </div>
    </footer>
  )
}

export default Footer;
