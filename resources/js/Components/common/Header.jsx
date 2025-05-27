import { useState } from 'react';
import { Link, usePage } from '@inertiajs/react';
import UserAvatar from './UserAvatar';

const Header = ({ logoClass, headerClass }) => {
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
    <header className='position-absolute top-0 w-100 z-3' style={{paddingTop: '30px'}}>
      <div className="container">
        <div className="row align-items-center justify-content-between">
          <div className="col-lg-2 col-6">
            <div className="logo">
              <img src="/assets/images/logo.png" alt="logo" />
            </div>
          </div>
          <div className="col-lg-6 col-6">
            <nav>
              <ul className='d-flex primary-navs align-items-center justify-content-center gap-20'>
                <li><Link href="/">Home</Link></li>
                <li><Link href="/stories">Stories</Link></li>
                <li><Link href="/publish">Publish</Link></li>
                <li><Link href="/about-us">About Us</Link></li>
              </ul>
            </nav>
          </div>
          <div className="col-lg-4">
            <div className="d-flex align-items-center gap-20">
              <Link href="/login" className='text-primary text-18'>Sign in </Link>
              <div className="text-primary text-18">/</div>
              <Link href="/signup" className='text-primary text-18'>Sign Up</Link>
              <Link href="/" className='btn btn-primary text-18'>Guest Login</Link>
            </div>
          </div>
        </div>
      </div>
    </header>
  )
};

export default Header;
