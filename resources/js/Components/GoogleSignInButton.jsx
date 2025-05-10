import React from 'react';

const GoogleSignInButton = ({ href, className = '' }) => {
  return (
    <a 
      href={href}
      className={`google-btn d-flex align-items-center justify-content-center ${className}`}
    >
      <div className="google-icon-wrapper">
        <img 
          className="google-icon" 
          src="/assets/images/google-logo.webp"
          alt="Google logo"
        />
      </div>
      <span className="btn-text">Sign in with Google</span>
    </a>
  );
};

export default GoogleSignInButton;
