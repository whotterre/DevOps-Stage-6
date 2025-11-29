#!/bin/sh
set -eux

# Ensure npm exists or is installed (for Alpine Linux)
if ! command -v npm >/dev/null 2>&1; then
   echo "npm not found. Installing nodejs and npm..."
   apk update && apk add --no-cache nodejs npm
fi

echo "Installing dependencies..."
if ! npm install; then
   echo "Something went wrong while trying to install dependencies for the Node.js application"
   exit 1
fi

echo "Starting application..."
if ! npm run start; then
   echo "Something went wrong while trying to start the application"
   exit 1
fi
