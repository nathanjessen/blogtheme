FROM node:20-slim

# Install essential packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    ruby-full \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

# Set up permissions for node user
RUN chown -R node:node /srv/jekyll && \
    mkdir -p /home/node/.gems && \
    chown -R node:node /home/node/.gems

# Set up gem environment
ENV GEM_HOME=/home/node/.gems
ENV PATH=/home/node/.gems/bin:$PATH

# Switch to node user
USER node

# Remove any existing bundler versions and install the correct one
RUN gem install bundler:2.5.0

# Copy package files first for better layer caching
COPY --chown=node:node package*.json ./
RUN npm install

# Copy all files first so gemspec is available
COPY --chown=node:node . .

# Install Ruby dependencies
RUN bundle _2.5.0_ install

# Build assets
ENV NODE_ENV=production
RUN npx gulp

# Switch back to root to install entrypoint
USER root
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Switch back to node user
USER node

# Expose ports
EXPOSE 4000 35729

# Set entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]
