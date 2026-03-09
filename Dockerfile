FROM ruby:3.3-slim

# Install Node.js 20 and essential packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

# Create an unprivileged user
RUN groupadd --gid 1000 app && \
    useradd --uid 1000 --gid app --shell /bin/bash --create-home app && \
    chown -R app:app /srv/jekyll && \
    mkdir -p /home/app/.gems && \
    chown -R app:app /home/app/.gems

# Set up gem environment
ENV GEM_HOME=/home/app/.gems
ENV PATH=/home/app/.gems/bin:$PATH

# Switch to app user
USER app

# Install bundler
RUN gem install bundler:2.6.6

# Copy package files first for better layer caching
COPY --chown=app:app package*.json ./
RUN npm install

# Copy all files so gemspec is available
COPY --chown=app:app . .

# Install Ruby dependencies
RUN bundle _2.6.6_ install

# Build assets
ENV NODE_ENV=production
RUN npx gulp

# Switch back to root to install entrypoint
USER root
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Switch back to app user
USER app

# Expose ports
EXPOSE 4000 35729

# Set entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
