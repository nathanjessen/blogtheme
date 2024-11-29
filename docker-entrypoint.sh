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

# Start Gulp watch in the background with logging
echo "Starting Gulp watch..."
npm run watch > /proc/1/fd/1 2>&1 &

# Start Jekyll server
echo "Starting Jekyll server..."
bundle exec jekyll serve --host 0.0.0.0 --livereload --trace &

# Wait for any process to exit
wait -n

# Exit with status of process that exited first
exit $?
