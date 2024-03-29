# blogtheme

A clean minimalist theme for [Jekyll](https://jekyllrb.com/) using [TailwindCSS](https://tailwindcss.com) that includes:

* A Jekyll blog theme
* A Gulpfile that does the following:

  * Compiles Jekyll
  * Runs [Browsersync](https://www.browsersync.io/) for local development
  * Compiles TailwindCSS

## Requirements

* [Bundler](http://bundler.io/)
* [Jekyll](https://jekyllrb.com/)
* [Node.js](https://nodejs.org/en/)
* [npm](https://www.npmjs.com/)
* [Ruby](https://www.ruby-lang.org/en/)

## Get started

* `bundle install` to install Ruby gems
* `npm install` to install npm packages listed in `package.json`
* Set index.html layout to home and create your posts in the _posts directory
* Many components can be found in the `_includes` directory. Follow the examples in the `_pages` directory for usage.
* `npm run start` or `npm run dev` to compile the site with development settings and run BrowserSync

## Build your site

* `npm run build:dev` to compile the site with development settings
* `npm run build:production` or `npm run build` to compile the site for production

## Installation

Add this line to your Jekyll site's `Gemfile`:

```ruby
gem "jekyll-remote-theme"
```

And add this line to your Jekyll site's `_config.yml`:

```yaml
remote_theme: nathanjessen/blogtheme@main
```

And then execute:

```ruby
bundle
```

Or install it yourself as:

```ruby
gem install jekyll-remote-theme
```

## Development

Your theme is setup just like a normal Jekyll site! To test your theme, run `bundle exec jekyll serve` and open your browser at `http://localhost:4000`. This starts a Jekyll server using your theme. Add pages, documents, data, etc. like normal to test your theme's contents. As you make modifications to your theme and to your content, your site will regenerate and you should see the changes in the browser after a refresh, just like normal.

To build gem file, run `gem build blogtheme.gemspec`
