import { useState } from 'react';
import { Link, usePage } from '@inertiajs/react';
import UserAvatar from './UserAvatar';
import { Icons } from '../../utils/icons';

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
    <header className={`position-absolute top-0 w-100 z-3 ${headerClass}`}>
      <div className="container-xxl">
        <div className="d-flex align-items-center justify-content-between">
          <div className="">
            <div className="logo">
              <img src="/assets/images/logo.png" alt="logo" />
            </div>
          </div>
          <div className="">
            <nav>
              <ul className={`d-flex primary-navs align-items-center justify-content-center gap-50 ${isMenuOpen ? 'active' : ''}`}>
                <div className="close-menu d-flex d-lg-none" onClick={toggleMenu}><Icons.Cross /></div>
                {/* navigation links */}
                <li><Link href="/">Home</Link></li>
                <li><Link href="/stories">Stories</Link></li>
                <li><Link href="/community">Community</Link></li>
                <li><Link href="/publish">Publish</Link></li>
                <li><Link href="/about">About</Link></li>
                <div className="d-flex d-lg-none flex-column align-items-center gap-20 justify-content-end justify-content-lg-start">
                  <Link href="/login" className='text-white text-18'>Sign in </Link>
                  <Link href="/register" className='text-white text-18'>Sign Up</Link>
                  <Link href="/guest-login" className='btn btn-secondary text-black text-18'>Guest Login</Link>
                </div>
              </ul>
            </nav>
          </div>
          <div
            className={`d-none d-lg-flex align-items-center gap-20 justify-content-end ${auth?.user ? 'justify-content-center' : 'justify-content-end'} ${isMenuOpen ? 'active' : ''}`}
          >
            {!auth?.user ? (
              <>
                <Link href="/login" className="text-primary text-18">Sign in</Link>
                <div className="text-primary fs-25">/</div>
                <Link href="/register" className="text-primary text-18">Sign Up</Link>
                <Link href="/guest-login" className="btn btn-primary text-18">Guest Login</Link>
              </>
            ) : (
              <>
                {auth.user.is_guest && (
                  <span className="btn btn-secondary d-none d-sm-block">Guest</span>
                )}
                <UserAvatar user={auth.user} className="d-none d-sm-block" />
               

                {/* Logout button */}
                <Link href="/logout" method="post" as="button" className="btn btn-primary text-white btn-sm d-none d-sm-block">
                  <i className="fas fa-sign-out-alt"></i>
                </Link>
              </>
            )}
          </div>

        </div>
      </div>
    </header>
  )
};

export default Header;
