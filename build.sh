#!/bin/bash

set -e

if [ "$DOCKER_USERNAME" == "" ]; then
    >&2 echo "missing env variable: DOCKER_USERNAME"
    exit 1
fi

source env.sh

docker build --force-rm --pull -t "$DOCKER_IMAGE_NAME" .
