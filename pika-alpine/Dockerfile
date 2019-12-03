FROM alpine:v3.4

ENV PIKA_VERSION v3.2.7

RUN apk add git && \
    git clone --branch ${PIKA_VERSION} https://github.com/Qihoo360/pika && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && \
    apk add glog snappy