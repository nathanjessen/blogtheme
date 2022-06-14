# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "blogtheme"
  spec.version       = "1.1.0"
  spec.authors       = ["nathanjessen"]
  spec.email         = ["nathan.jessen@gmail.com"]

  spec.summary       = "Write a short summary, because Rubygems requires one."
  spec.homepage      = "https://github.com/nathanjessen/blogtheme"
  spec.license       = "MIT"

  regex      = %r{^(_layouts|_includes|_sass|LICENSE|README)/i}
  spec.files = `git ls-files -z`.split("\x0").select { |f| f.match(regex) }

  spec.add_runtime_dependency "jekyll", "~> 4.0"
  spec.add_runtime_dependency 'jekyll-feed', '~> 0.9'
  spec.add_runtime_dependency 'jekyll-sitemap', "~> 1.4.0"
  # spec.add_runtime_dependency 'jekyll-paginate', "~> 1.1.0"
  spec.add_runtime_dependency 'jekyll-seo-tag', "~> 2.8.0"

  spec.add_development_dependency 'bundler', '~> 2.1.2'
  spec.add_development_dependency 'rake', '~> 12.3'
end
