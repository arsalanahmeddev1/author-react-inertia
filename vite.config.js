import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import react from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  plugins: [
    laravel(
      {
        input: {
          app: 'resources/js/app.jsx',
          admin: 'resources/js/admin/DashboardNew.jsx',
        },
         refresh: true
      }
    ),
    tailwindcss(),
    react(),
  ],

});