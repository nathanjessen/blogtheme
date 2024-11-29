/** @type {import('tailwindcss').Config} */

module.exports = {
  content: [
    "_site/**/*.html",
    "**/*.html",
    "**/*.md",
    "**/*.markdown"
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/typography"),
  ],
}
