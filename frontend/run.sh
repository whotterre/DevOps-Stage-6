#!/bin/sh

set -eux

if ! command -v npm > /dev/null 2>&1; then 
   echo "npm not found. Installing Node.js and npm "
   apk update && apk add --no-cache nodejs npm 
fi

echo "Installing dependencies..."
if ! npm install; then 
    echo "Something went wrong while trying to install dependencies..."
    exit 1
fi

# Build the application
if ! npm run build; then 
   echo "Something went wrong while trying to build the application..."
   exit 1
fi

# Run the app
if ! npm run start; then 
    echo "Something went wrong while trying to start the application..."
    exit 1
fi

echo "Vue frontend readyyyyy....."