
import 'bootstrap/dist/css/bootstrap.min.css';
import '@fortawesome/fontawesome-free/css/all.css';
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import 'react-quill-new/dist/quill.snow.css';
import '../css/app.css';
import '../js/assets/styles/utilities.css';
import '../js/assets/styles/style.css';
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
               

                {/* Render the app */}
                <App {...props} />
            </HelmetProvider>
        );
    },
    progress: {
        color: '#4B5563',
    },
});
