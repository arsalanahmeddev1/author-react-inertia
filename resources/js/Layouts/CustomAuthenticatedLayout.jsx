import { useState, useEffect } from 'react';
import { Link, usePage } from '@inertiajs/react';
import Footer from '@/Components/common/Footer';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import '../../js/assets/styles/utilities.css';
import '../../js/assets/styles/style.css';
import '../../js/assets/styles/auth.css';
import '../../js/assets/styles/profile.css';

export default function CustomAuthenticatedLayout({ children, title }) {
  const { auth } = usePage().props;
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  const toggleMenu = () => {
    setIsMenuOpen(!isMenuOpen);
  };

  useEffect(() => {
    // Add lazy loading to images
    const images = document.querySelectorAll('img');
    images.forEach(img => {
      img.setAttribute('loading', 'lazy');
    });
  }, []);

  return (
    <div className="min-vh-100 d-flex flex-column">
      {/* Header */}
      <header className="header py-3 w-100 bg-primary-theme">
        <div className="container">
          <div className="row align-items-center">
            <div className="col-lg-2 col-6">
              <div className="logo">
                <Link href="/">
                  <img src="/assets/images/logo.png" alt="logo" style={{ maxWidth: '80px' }} />
                </Link>
              </div>
            </div>
            <div className="col-lg-6">
              <nav className="d-none d-lg-block">
                <ul className="list-unstyled d-flex justify-content-center mb-0">
                  <li className="mx-3"><Link href="/" className="text-white fs-16 secondry-font">Home</Link></li>
                  <li className="mx-3"><Link href="/stories" className="text-white fs-16 secondry-font">Stories</Link></li>
                  <li className="mx-3"><Link href="/publish" className="text-white fs-16 secondry-font">Publish</Link></li>
                  <li className="mx-3"><Link href="/about" className="text-white fs-16 secondry-font">About Us</Link></li>
                </ul>
              </nav>
            </div>
            <div className="col-lg-4 col-6">
              <div className="d-flex align-items-center justify-content-end">
                {auth?.user ? (
                  <>
                    <Link href={route('profile.edit')} className="text-white fs-16 secondry-font d-none d-lg-block me-3">Profile</Link>
                    <div className="vertical-line d-none d-lg-block mx-2"></div>
                    <Link
                      href={route('logout')}
                      method="post"
                      as="button"
                      className="text-white fs-16 secondry-font d-none d-lg-block me-3 bg-transparent border-0"
                    >
                      Log Out
                    </Link>
                  </>
                ) : (
                  <>
                    <Link href={route('register')} className="text-white fs-16 secondry-font d-none d-lg-block me-3">Sign Up</Link>
                    <div className="vertical-line d-none d-lg-block mx-2"></div>
                    <Link href={route('login')} className="text-white fs-16 secondry-font d-none d-lg-block me-3">Sign In</Link>
                    <div className="vertical-line d-none d-lg-block mx-2"></div>
                    <Link href="/guest" className="btn btn-secondary btn-sm d-none d-lg-block">Guest Login</Link>
                  </>
                )}
                <div className="d-lg-none">
                  <button className="btn btn-link text-white p-0 border-0" onClick={toggleMenu}>
                    <i className="fa-solid fa-bars fs-24"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Mobile Menu */}
        <div className={`mobile-menu position-fixed top-0 start-0 h-100 w-100 bg-primary-theme ${isMenuOpen ? 'd-block' : 'd-none'}`} style={{ zIndex: 1050 }}>
          <div className="container py-4">
            <div className="d-flex justify-content-end mb-4">
              <button className="btn btn-link text-white p-0 border-0" onClick={toggleMenu}>
                <i className="fa-solid fa-xmark fs-24"></i>
              </button>
            </div>
            <ul className="list-unstyled">
              <li className="mb-3"><Link href="/" className="text-white fs-20 secondry-font d-block py-2" onClick={toggleMenu}>Home</Link></li>
              <li className="mb-3"><Link href="/stories" className="text-white fs-20 secondry-font d-block py-2" onClick={toggleMenu}>Stories</Link></li>
              <li className="mb-3"><Link href="/publish" className="text-white fs-20 secondry-font d-block py-2" onClick={toggleMenu}>Publish</Link></li>
              <li className="mb-3"><Link href="/about" className="text-white fs-20 secondry-font d-block py-2" onClick={toggleMenu}>About Us</Link></li>
              {auth?.user ? (
                <>
                  <li className="mb-3"><Link href={route('profile.edit')} className="text-white fs-20 secondry-font d-block py-2" onClick={toggleMenu}>Profile</Link></li>
                  <li className="mb-3">
                    <Link
                      href={route('logout')}
                      method="post"
                      as="button"
                      className="text-white fs-20 secondry-font d-block py-2 bg-transparent border-0 w-100 text-start"
                      onClick={toggleMenu}
                    >
                      Log Out
                    </Link>
                  </li>
                </>
              ) : (
                <>
                  <li className="mb-3"><Link href={route('register')} className="text-white fs-20 secondry-font d-block py-2" onClick={toggleMenu}>Sign Up</Link></li>
                  <li className="mb-3"><Link href={route('login')} className="text-white fs-20 secondry-font d-block py-2" onClick={toggleMenu}>Sign In</Link></li>
                  <li><Link href="/guest" className="btn btn-secondary d-inline-block" onClick={toggleMenu}>Guest Login</Link></li>
                </>
              )}
            </ul>
          </div>
        </div>
      </header>

      {/* Page Title */}
      {title && (
        <div className="bg-secondry-theme py-3">
          <div className="container">
            <h1 className="text-white fs-30 primary-font text-center mb-0">{title}</h1>
          </div>
        </div>
      )}

      {/* Main Content */}
      <main className="flex-grow-1 sec-bg py-4">
        <div className="container">
          {children}
        </div>
      </main>

      {/* Footer */}
      <Footer />
    </div>
  );
}
