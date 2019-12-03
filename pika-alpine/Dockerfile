FROM alpine

ENV PIKA_VERSION v3.2.7

RUN apk add git make && \
    git clone --branch ${PIKA_VERSION} https://github.com/Qihoo360/pika && \
    cd ./pika && \
    make