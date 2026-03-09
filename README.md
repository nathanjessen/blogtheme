# blogtheme

A clean minimalist theme for [Jekyll](https://jekyllrb.com/) using [TailwindCSS](https://tailwindcss.com) that includes:

* A Jekyll blog theme
* A Gulpfile that does the following:
  * Compiles Jekyll
  * Runs [Browsersync](https://www.browsersync.io/) for local development
  * Compiles TailwindCSS

## Using this theme

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "blogtheme"
```

Add this line to your Jekyll site's `_config.yml`:

```yaml
theme: blogtheme
```

Then install dependencies:

```bash
bundle install
```

## Customization

All theme settings are configured in `_config.yml`. Key options:

```yaml
title: Your Site Title
description: Your site description
author: Your Name

# Google Analytics 4
# ga_tracking_id: G-XXXXXXXXXX

# Social links — uncomment and add your username
# twitter_url: https://twitter.com/username
# github_url: https://github.com/username
# linkedin_url: https://www.linkedin.com/in/username
# medium_url: https://medium.com/username
# instagram_url: https://www.instagram.com/username
# dribbble_url: https://dribbble.com/username
# codepen_url: https://codepen.io/username
# angellist_url: https://angel.co/username

# Homepage section content
recent_posts_title: Recent Posts
recent_posts_content: A short description for your recent posts section.
featured_title: Featured Works
featured_content: A short description for your featured works section.
services_title: Services
services_content: A short description for your services section.

footer_content: "&copy; 2025 Your Name"
```

### Data files

Customize homepage content by editing the files in `_data/`:

| File | Purpose |
|---|---|
| `_data/featured.yml` | Featured projects shown on the homepage |
| `_data/services.yml` | Services section on the homepage |
| `_data/testimonials.yml` | Testimonial shown on the homepage |

### Theme structure

| Directory | Purpose |
|---|---|
| `_layouts/` | Page layout templates |
| `_includes/` | Reusable components |
| `_styles/` | CSS source files (TailwindCSS) |
| `_pages/` | Built-in pages (posts, tags, categories, 404) |
| `_data/` | Homepage content (featured, services, testimonials) |
| `assets/` | Static assets (images, compiled CSS) |

## Development Requirements

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Node.js](https://nodejs.org/) (for running npm commands)

## Local Development

The theme uses Docker for development to ensure a consistent environment across different machines.

### First Time Setup

```bash
npm install
npm run docker:rebuild
```

### Day-to-Day Development

Start the dev server with live reload at http://localhost:4000:

```bash
npm start
```

Stop the container:

```bash
npm run docker:stop
```

> **Note:** Run `npm run docker:rebuild` again any time you change the `Dockerfile`, `Gemfile`, or `package.json`.

## Building

* Build for development:
  ```bash
  npm run build:dev
  ```

* Build for production:
  ```bash
  npm run build
  ```
  This will create an optimized production build with minified assets.

## Publishing Theme Updates

1. Update the version number in both `package.json` and `blogtheme.gemspec`
2. Build the gem:
   ```bash
   gem build blogtheme.gemspec
   ```
3. Push the gem to RubyGems:
   ```bash
   gem push blogtheme-x.x.x.gem
   ```
4. Commit, tag, and push:
   ```bash
   git add package.json blogtheme.gemspec
   git commit -m "Release version x.x.x"
   git tag vx.x.x
   git push origin main --tags
   ```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nathanjessen/blogtheme.
