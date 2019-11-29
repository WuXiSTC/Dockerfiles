FROM gluster/glusterfs-client

ENV VERSION=v12.13.1
ENV DISTRO=linux-x64

RUN wget https://nodejs.org/dist/${VERSION}/node-${VERSION}-${DISTRO}.tar.gz -O node.tar.gz && \
    mkdir -p /usr/local/lib/nodejs && \
    tar -xzvf node.tar.gz -C /usr/local/lib/nodejs && \
    rm node.tar.gz

ENV PATH=/usr/local/lib/nodejs/node-${VERSION}-${DISTRO}/bin:${PATH}

ADD ./start.sh ./
