import { useState } from 'react';
import { Link } from '@inertiajs/react';

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  return (
    <header className="header pt-20 position-absolute top-0 w-100">
      <div className="container position-relative">
        <div className="row justify-content-between">
          <div className="col-lg-3 col-6">
            <div className="logo position-absolute top-0 start-0 text-center" data-aos-duration="3000" data-aos="fade-right">
              <img src="/assets/images/logo.png" alt="logo" />
              <span className="text-white d-block fs-29">Verba aeternum fluentia</span>
              <span className="text-white fs-24">(Words flowing eternally)</span>
            </div>
          </div>
          <div className="col-lg-4">
            <nav>
              <ul className={`primary-navs d-flex align-items-center justify-content-between pt-50 ${isMenuOpen ? 'active' : ''}`} data-aos-duration="3000" data-aos="fade-down">
                <div className="close-icon">
                  <i className="fa-solid fa-xmark menu-toggle" onClick={toggleMenu}></i>
                </div>
                <li><Link href="/">home</Link></li>
                <li><Link href="/stories">Stories</Link></li>
                <li><Link href="/publish">Publish</Link></li>
                <li><Link href="/about">About Us</Link></li>
                <Link href='register' className="btn btn-secondary text-white d-block d-sm-none">Sign Up</Link>
                <Link href='login' className="btn btn-secondary text-white d-block d-sm-none">Sign In</Link>
                <Link href="/guest" className="btn btn-secondary d-block d-sm-none">Guest Login</Link>
              </ul>
            </nav>
          </div>
          <div className="col-lg-4">
            <div className="d-flex align-items-center gap-20 pt-33 justify-content-end justify-content-lg-between" data-aos-duration="3000" data-aos="fade-down">
              <Link href='register' className="text-white d-none d-sm-block">Sign Up</Link>
              <div className="vertical-line d-none d-sm-block"></div>
              <Link href='login' className="text-white d-none d-sm-block">Sign In</Link>
              <div className="vertical-line d-none d-sm-block"></div>
              <Link href="/guest" className="btn btn-secondary d-none d-sm-block">Guest Login</Link>
              <div className="menu-icon">
                <i className="fa-solid fa-bars menu-toggle" onClick={toggleMenu}></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Header;
