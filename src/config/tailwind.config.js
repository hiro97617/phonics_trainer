const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    "./public/*.html",
    "./src/app/helpers/**/*.rb",
    "./src/app/javascript/**/*.js",
    "./app/views/admin/**/**/*.{html.erb, erb, haml, html, slim}",
    "./app/views/**/**/*.html.erb",
    "./app/views/**/*.html.erb"
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
