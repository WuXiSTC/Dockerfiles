FROM node:buster

RUN wget -O - https://download.gluster.org/pub/gluster/glusterfs/7/rsa.pub | apt-key add - && \
    echo deb [arch=amd64] https://download.gluster.org/pub/gluster/glusterfs/7/LATEST/Debian/buster/amd64/apt buster main > /etc/apt/sources.list.d/gluster.list && \
    apt-get update && \
    apt-get install glusterfs-client

ADD ./ /app