import { useState } from 'react';
import { Link, usePage } from '@inertiajs/react';

const Header = ({logoClass , headerClass}) => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const { url } = usePage();
  const { auth } = usePage().props;

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  // Check if the current URL matches the link
  const isActive = (path) => {
    return url.startsWith(path);
  };

  return (
    <header className={`header pt-20 position-absolute top-0 w-100 ${headerClass ? headerClass : ''} }`}>
      <div className="container position-relative">
        <div className="row justify-content-between">
          <div className="col-lg-3 col-6">
            <div className="logo position-absolute top-0 start-0 text-center" data-aos-duration="3000" data-aos="fade-right">
              <img src="/assets/images/logo.png" className={`${logoClass}`} alt="logo" />
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
                <li><Link href="/" className={isActive('/') && !isActive('/stories') && !isActive('/publish') && !isActive('/about') ? 'text-primary-theme' : ''}>Home</Link></li>
                <li><Link href="/stories" className={isActive('/stories') ? 'text-primary-theme' : ''}>Stories</Link></li>
                <li><Link href="/publish" className={isActive('/publish') ? 'text-primary-theme' : ''}>Publish</Link></li>
                <li><Link href="/about" className={isActive('/about') ? 'text-primary-theme' : ''}>About Us</Link></li>
                {!auth?.user ? (
                  <>
                    <Link href='/register' className="btn btn-secondary text-white d-block d-sm-none">Sign Up</Link>
                    <Link href='/login' className="btn btn-secondary text-white d-block d-sm-none">Sign In</Link>
                    <Link href="/guest-login" className="btn btn-secondary d-block d-sm-none">Guest Login</Link>
                  </>
                ) : auth?.user?.is_guest ? (
                  <div className="d-flex flex-column gap-2 d-block d-sm-none">
                    <span className="btn btn-secondary">Guest</span>
                    <Link href="/logout" method="post" as="button" className="btn btn-outline-secondary btn-sm">
                      <i className="fas fa-sign-out-alt me-1"></i> Logout
                    </Link>
                  </div>
                ) : (
                  <Link href="/logout" method="post" as="button" className="btn btn-secondary d-block d-sm-none">Logout</Link>
                )}
              </ul>
            </nav>
          </div>
          <div className="col-lg-4">
            <div className="d-flex align-items-center gap-20 pt-33 justify-content-end justify-content-lg-between" data-aos-duration="3000" data-aos="fade-down">
              {!auth?.user ? (
                <>
                  <Link href='/register' className="text-white d-none d-sm-block">Sign Up</Link>
                  <div className="vertical-line d-none d-sm-block"></div>
                  <Link href='/login' className="text-white d-none d-sm-block">Sign In</Link>
                  <div className="vertical-line d-none d-sm-block"></div>
                  <Link href="/guest-login" className="btn btn-secondary d-none d-sm-block">Guest Login</Link>
                </>
              ) : auth?.user?.is_guest ? (
                <div className="d-flex align-items-center gap-2">
                  <span className="btn btn-secondary d-none d-sm-block">Guest</span>
                  <Link href="/logout" method="post" as="button" className="btn btn-outline-secondary btn-sm d-none d-sm-block">
                    <i className="fas fa-sign-out-alt"></i>
                  </Link>
                </div>
              ) : (
                <Link href="/logout" method="post" as="button" className="btn btn-secondary d-none d-sm-block">Logout</Link>
              )}
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
