#!/bin/sh
set -eux

# Ensure Python 3 and pip are installed (for Alpine)
if ! command -v python3 >/dev/null 2>&1; then
  echo "Python3 not found. Installing python3 and py3-pip..."
  apk update && apk add --no-cache python3 py3-pip
fi

echo "Installing dependencies..."
if [ -f requirements.txt ]; then
  pip3 install --no-cache-dir -r requirements.txt
fi

echo "Running log-message-processor..."
exec python3 main.py