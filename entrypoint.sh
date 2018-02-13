#!/bin/bash
cd $PROJECT_DIR
groupmod -og ${GID} node
usermod -ou ${UID} -g ${GID} node
chown -R $UID:$GID /home/node/
sudo -u node find syncano/ -name '.dist' -prune -exec rm -r {} \;
sudo -u node s $@