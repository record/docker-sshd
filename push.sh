#!/bin/bash

set -e

if [ "$DOCKER_USERNAME" == "" ]; then
    >&2 echo "missing env variable: DOCKER_USERNAME"
    exit 1
fi

source ./env.sh

./build.sh

docker login
docker push "$DOCKER_IMAGE_NAME"
docker rmi $(docker images -f "dangling=true" -q)
