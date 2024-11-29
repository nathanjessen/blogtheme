FROM ruby:3.1-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

# Create jekyll user first
RUN groupadd -r jekyll && useradd -m -r -g jekyll jekyll
RUN mkdir -p /srv/jekyll && chown -R jekyll:jekyll /srv/jekyll

WORKDIR /srv/jekyll

# Install gems globally first
RUN gem install bundler:2.1.4
COPY Gemfile* ./
RUN bundle config set system 'true' && \
    bundle install && \
    chown -R jekyll:jekyll /usr/local/bundle

# Copy package files and install npm dependencies
COPY package*.json ./
RUN npm ci && \
    chown -R jekyll:jekyll /srv/jekyll/node_modules

# Switch to jekyll user
USER jekyll
ENV HOME=/home/jekyll

EXPOSE 4000 35729

# Copy start script
COPY --chown=jekyll:jekyll docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
