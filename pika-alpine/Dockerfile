FROM alpine

ENV PIKA_VERSION v3.2.7

RUN apk add git make snappy-dev protobuf-dev gcc g++ && \
    apk add gflags-dev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    apk add glog-dev --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    git clone --branch ${PIKA_VERSION} https://github.com/Qihoo360/pika && \
    cd pika && \
    make
