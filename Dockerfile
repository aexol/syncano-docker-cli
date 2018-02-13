FROM node:8.9.4-stretch

ENV UID=1000
ENV GID=1000
ENV PROJECT_DIR=/home/node/syncano-project

ADD entrypoint.sh /entrypoint.sh
RUN apt update && apt-get install sudo \
    && echo 'root ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers \
    && npm install -g @syncano/cli@canary
VOLUME ["/home/node/syncano.yml"]
WORKDIR /home/node/syncano-project
ENTRYPOINT [ "/entrypoint.sh" ]