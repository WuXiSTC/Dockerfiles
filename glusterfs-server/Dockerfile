FROM debian:buster

RUN apt-get update && \
    apt-get install -y wget apt-utils && \
    wget -O - https://download.gluster.org/pub/gluster/glusterfs/LATEST/rsa.pub | apt-key add - && \
    echo deb [arch=amd64] https://download.gluster.org/pub/gluster/glusterfs/7/LATEST/Debian/buster/amd64/apt buster main > /etc/apt/sources.list.d/gluster.list && \
    apt-get update && \
    apt-get install glusterfs-server && \
    apt-get --purge autoremove wget apt-utils && \
    apt-get clean