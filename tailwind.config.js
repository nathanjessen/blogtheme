/** @type {import('tailwindcss').Config} */

module.exports = {
  content: [
    "_site/**/*.html",
    "**/*.html",
    "**/*.md",
    "**/*.markdown"
  ],
  theme: {
    extend: {
      colors: {
        // Using modern color spaces for better vibrancy
        primary: {
          50: 'oklch(97% 0.02 150)',
          100: 'oklch(94% 0.04 150)',
          200: 'oklch(88% 0.08 150)',
          300: 'oklch(82% 0.12 150)',
          400: 'oklch(76% 0.16 150)',
          500: 'oklch(70% 0.20 150)',
          600: 'oklch(64% 0.24 150)',
          700: 'oklch(58% 0.28 150)',
          800: 'oklch(52% 0.32 150)',
          900: 'oklch(46% 0.36 150)',
        }
      },
      // Enable modern scroll behavior
      scrollbar: ['rounded', 'dark'],
      // Add balanced text for better typography
      textBalance: true,
      // Add modern text decoration styles
      textDecorationThickness: {
        3: '3px',
      },
      // Add modern backdrop blur values
      backdropBlur: {
        xs: '2px',
      },
    },
  },
  plugins: [
    require("@tailwindcss/typography"),
  ],
  // Enable modern features
  future: {
    hoverOnlyWhenSupported: true,
  },
}
