#!/bin/bash
SOCK_WORK_DIR=/home/node/.sock-dist-workdir
cd $SOCKET_DIR
if [ ! -f ${SOCKET_DIR}/socket.yml ]; then
    echo "Must be run from socket dir."
    exit 1
fi
# Small hack, to run with host UID and GID.
groupmod -og ${GID} node
usermod -ou ${UID} -g ${GID} node
chown -R $UID:$GID /home/node/
# Copy host socket to workdir
sudo -u node cp -r ${SOCKET_DIR} ${SOCK_WORK_DIR}
cd ${SOCK_WORK_DIR}
rm -r node_modules
# Just to be safe, rebuild dev environment
sudo -u node npm install
if [ "${BUILD:-ENV}" = "ENV" ]; then
    # Build socket environment and copy it to host.
    sudo -u node sh bin/compile-env
    sudo -u node rm -rf ${SOCKET_DIR}/.dist/node_modules
    sudo -u node cp -r ${SOCK_WORK_DIR}/.dist/node_modules ${SOCKET_DIR}/.dist/node_modules
elif [ "${BUILD}" = "SRC" ]; then
    # Run socket build and copy it to host.
    sudo -u node sh bin/compile
    sudo -u node rm -rf ${SOCKET_DIR}/.dist
    sudo -u node cp -r ${SOCK_WORK_DIR}/.dist ${SOCKET_DIR}/.dist
fi