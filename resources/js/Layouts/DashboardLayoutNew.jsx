import React from 'react';
import { Helmet } from 'react-helmet-async';
import Header from '../Components/dashboard/dashboard-new/Header';
import Sidebar from '../Components/dashboard/dashboard-new/Sidebar';
import Footer from '../Components/dashboard/dashboard-new/Footer';

const DashboardLayoutNew = ({ title, description, children }) => {
    return (
        <>
            <Helmet>
                <title>{title || 'My App'}</title>
                <meta
                    name="description"
                    content={description || 'Default description for My App'}
                />
                {/* Meta tags for character set, viewport, etc. */}
                <meta charSet="UTF-8" />
                <meta httpEquiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <meta name="keywords" content="admin template, Cuba admin template, dashboard template, flat admin template, responsive admin template, web app" />
                <meta name="author" content="pixelstrap" />

                {/* Favicon */}
                <link rel="icon" href="/assets/images/favicon.png" type="image/x-icon" />
                <link rel="shortcut icon" href="/assets/images/favicon.png" type="image/x-icon" />

                {/* Google Fonts */}
                <link href="https://fonts.googleapis.com/css?family=Rubik:400,500,700&display=swap" rel="stylesheet" />
                <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900&display=swap" rel="stylesheet" />

                {/* Vendor CSS */}
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/fontawesome.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/icofont.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/themify.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/flag-icon.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/feather-icon.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/slick.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/slick-theme.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/scrollbar.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/animate.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/bootstrap.css" />

                {/* Main CSS */}
                <link rel="stylesheet" href="/assets/dashboard/assets/css/style.css" />
                <link id="color" rel="stylesheet" href="/assets/dashboard/assets/css/color-1.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/responsive.css" />
                <link rel="stylesheet" href="/assets/dashboard/assets/css/custom.css" />

                {/* JS Scripts (use defer to prevent blocking rendering) */}
                <script defer src="/assets/dashboard/assets/css/color-1.js"></script>
                <script defer src="/assets/dashboard/assets/css/responsive.js"></script>
                <script defer src="/assets/dashboard/assets/css/style.js"></script>
            </Helmet>
            <div class="page-wrapper compact-wrapper" id="pageWrapper">

                <Header />
                <div class="page-body-wrapper">
                    <Sidebar />
                    <div className="page-body">
                        {children}
                    </div>
                    <Footer />
                </div>
            </div>
        </>
    );
};

export default DashboardLayoutNew;
