import React from 'react';
import { ToastContainer as ReactToastContainer } from 'react-toastify';

const ToastContainer = () => {
  return (
    <ReactToastContainer
      position="top-right"
      autoClose={3000}
      hideProgressBar={false}
      newestOnTop
      closeOnClick
      rtl={false}
      pauseOnFocusLoss
      draggable
      pauseOnHover
      theme="colored"
      toastStyle={{
        fontFamily: 'var(--secondry-font)',
        fontSize: 'var(--text-16)',
        borderRadius: '8px',
      }}
    />
  );
};

export default ToastContainer;
