/** @type {import('tailwindcss').Config} */

module.exports = {
  content: [
    "./_site/**/*.html",
    "./_includes/**/*.{html,md}",
    "./_layouts/**/*.{html,md}",
    "./_posts/**/*.{md,markdown}",
    "./_pages/**/*.html",
    "./*.{html,md,markdown}"
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require("@tailwindcss/typography"),
  ],
}
