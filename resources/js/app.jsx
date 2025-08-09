import 'bootstrap/dist/css/bootstrap.min.css';
import '../assets/dashboard/assets/css/vendors/bootstrap.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import '../js/assets/styles/utilities.css';
import '../js/assets/styles/style.css';
import '@fortawesome/fontawesome-free/css/all.css';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import 'react-quill-new/dist/quill.snow.css';
import '../css/app.css';
import { createInertiaApp } from '@inertiajs/react';
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers';
import { createRoot } from 'react-dom/client';
// Import HelmetProvider
import { HelmetProvider } from 'react-helmet-async';
import { Helmet } from 'react-helmet-async';

const appName = import.meta.env.VITE_APP_NAME || 'Laravel';

createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    resolve: (name) =>
        resolvePageComponent(
            `./Pages/${name}.jsx`,
            import.meta.glob('./Pages/**/*.jsx'),
        ),
    setup({ el, App, props }) {
        const root = createRoot(el);

        root.render(
            // Wrap the entire App with HelmetProvider
            <HelmetProvider>
                {/* Add Helmet component here for CDNs */}
                <Helmet>
                    <title>{props.title || 'My App'}</title>
                    <meta name="description" content={props.description || 'Default description for My App'} />

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
                    {/* <link rel="stylesheet" href="/assets/dashboard/assets/css/vendors/bootstrap.css" /> */}

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

                {/* Render the app */}
                <App {...props} />
            </HelmetProvider>
        );
    },
    progress: {
        color: '#4B5563',
    },
});
