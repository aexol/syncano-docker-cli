#!/bin/bash
PROJECT_DIR=$(pwd)
if [ -f $PROJECT_DIR/syncano.yml ]; then
    PROJECT_DIR=$(dirname ${PROJECT_DIR})
fi
docker run \
    -it \
    --rm \
    -e UID=$(id -u) \
    -e GID=$(id -g) \
    -e PROJECT_DIR=${PROJECT_DIR} \
    --mount type=bind,source="${PROJECT_DIR}",target="${PROJECT_DIR}" \
    --mount type=bind,source=${HOME}/syncano.yml,target=/home/node/syncano.yml \
    syncano-cli $@