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

And add this line to your Jekyll site's `_config.yml`:

```yaml
theme: blogtheme
```

And then execute:

```bash
$ bundle install
```

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

### Theme Structure
* Components can be found in the `_includes` directory
* Layout templates are in the `_layouts` directory
* Styles are in the `_styles` directory
* Example pages are in the `_pages` directory

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

1. Update version numbers in both `package.json` and `blogtheme.gemspec`
2. Build the gem:
   ```bash
   gem build blogtheme.gemspec
   ```
3. Push the new gem to RubyGems:
   ```bash
   gem push blogtheme-x.x.x.gem
   ```
   Replace x.x.x with your new version number

4. Commit and push changes to GitHub:
   ```bash
   git add .
   git commit -m "Release version x.x.x"
   git tag vx.x.x
   git push origin main --tags
   ```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nathanjessen/blogtheme.
