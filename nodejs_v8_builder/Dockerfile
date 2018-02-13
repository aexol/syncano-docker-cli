FROM node:8.9.4-stretch

ENV UID=1000
ENV GID=1000
ENV SOCKET_DIR=/home/node/syncano-project

ADD entrypoint.sh /entrypoint.sh
RUN apt update && apt-get install sudo \
    && echo 'root ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers
WORKDIR ${SOCKET_DIR}
ENTRYPOINT [ "/entrypoint.sh" ]