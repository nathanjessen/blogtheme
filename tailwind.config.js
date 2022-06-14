/** @type {import('tailwindcss').Config} */

module.exports = {
  content: ["_site/**/*.html"],
  theme: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/typography"),
    require("@tailwindcss/line-clamp"),
  ],
};
