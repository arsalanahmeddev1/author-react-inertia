import { useEffect } from 'react';
import Header from '../Components/common/Header';
import Footer from '../Components/common/Footer';
import AOS from 'aos';
import 'aos/dist/aos.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import '../../js/assets/styles/utilities.css';
import '../../js/assets/styles/style.css';

export default function Layout({ children }) {
  useEffect(() => {
    // Initialize AOS
    if (window.innerWidth < 1025) {
      AOS.init({
        disable: true
      });
    } else {
      AOS.init();
    }

    // Add lazy loading to images
    const images = document.querySelectorAll('img');
    images.forEach(img => {
      img.setAttribute('loading', 'lazy');
    });
  }, []);

  return (
    <>
      <Header />
      <main>{children}</main>
      <Footer />
    </>
  );
}
