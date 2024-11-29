FROM node:20-slim

# Install essential packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    ruby-full \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv/jekyll

# Install bundler
RUN gem install bundler:2.5.6

# Copy package files first for better layer caching
COPY package*.json ./
RUN npm install

# Copy Gemfile and install dependencies
COPY Gemfile* ./
RUN bundle install

# Copy the rest of the application
COPY . .

# Build assets
RUN npm run build

# Expose ports
EXPOSE 4000 35729

# Set the entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
