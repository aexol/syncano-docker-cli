#!/bin/sh

SOCKET_DIR=$(pwd)
if [ ! -f ${SOCKET_DIR}/socket.yml ]; then
    echo "Must be run from socket directory."
    exit 1
fi
RUNTIME=$(npx yaml2json socket.yml | jq -r '.runtime')
if [ "${RUNTIME}" = "null" ]; then
    RUNTIME="nodejs_v8"
fi
containerId=$(docker run \
    -d \
    --rm \
    -e UID=$(id -u) \
    -e GID=$(id -g) \
    -e SOCKET_DIR=${SOCKET_DIR} \
    -e BUILD=ENV \
    --mount type=bind,source="${SOCKET_DIR}",target="${SOCKET_DIR}" \
    syncano-builder:${RUNTIME} $@)
docker logs -f ${containerId}