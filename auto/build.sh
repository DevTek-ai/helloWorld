#!/usr/bin/env sh

set -eux

echo "🛠 Building project..."
  
  IMAGE_TAG=${BUILD_VERSION:=latest}
  ./mvnw package -Pprod -Dmaven.test.skip=true -DskipTests jib:dockerBuild  
  docker tag platform:latest ${REPOSITORY_URI}:latest
  docker tag ${REPOSITORY_URI}:latest ${REPOSITORY_URI}:${IMAGE_TAG}
  docker push ${REPOSITORY_URI}:latest
  docker push ${REPOSITORY_URI}:${IMAGE_TAG}
