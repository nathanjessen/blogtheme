#!/bin/bash
set -e

# Function to handle process termination
cleanup() {
    echo "Cleaning up processes..."
    kill $(jobs -p)
    exit 0
}

# Set up trap for cleanup
trap cleanup SIGTERM SIGINT

# Install gems in user's home directory
export GEM_HOME="$HOME/.gems"
export PATH="$GEM_HOME/bin:$PATH"

# Remove any existing bundler versions and install the correct one
gem uninstall bundler --all --force || true
gem install bundler:2.5.0

# Install dependencies if they're not installed
bundle check || bundle install

# Add git safe directory
git config --global --add safe.directory /srv/jekyll

if [ "$NODE_ENV" = "development" ]; then
  # Start development server with live reload
  echo "Starting development server..."
  npx gulp serve
else
  # Production build
  echo "Running production build..."
  npx gulp
fi
