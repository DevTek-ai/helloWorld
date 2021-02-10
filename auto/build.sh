#!/usr/bin/env sh

set -eux

echo "🛠 Building project..."
  
  IMAGE_TAG=${BUILD_VERSION:=latest}
  node app.js

