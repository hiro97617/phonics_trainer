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
    extend: {
      colors:{
        lime: colors.lime,
        cyan: colors.cyan,
        sky: colors.sky
      }
    },
  },
  plugins: [],
}

