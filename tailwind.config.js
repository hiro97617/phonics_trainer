/** @type {import('tailwindcss').Config} */

module.exports = {
  mode: 'jit',
  content: [
    './app/views/**/*.html.erb',
    './app/views/**/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  theme: {
    colors: {
      sky: {
        25: "#eaf6fd",
        50: '#f0f9ff',
        100: '#e0f2fe',
        200: '#bae6fd',
        300: '#7dd3fc',
        400: "#38bdf8",
        500: '#0ea5e9',
        600: '#0284c7',
      },
    },
    extend: {},
  },
  plugins: [],
}

