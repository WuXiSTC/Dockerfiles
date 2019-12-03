FROM alpine

ENV PIKA_VERSION v3.2.7

RUN apk add git snappy && \
    apk add gflags --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    apk add glog --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing && \
    git clone --branch ${PIKA_VERSION} https://github.com/Qihoo360/pika