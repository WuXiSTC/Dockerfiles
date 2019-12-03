FROM debian:buster

ENV PIKA_VERSION v3.2.7

RUN apt-get update && \
    apt-get install -y git make g++ && \
    git clone --branch ${PIKA_VERSION} https://github.com/Qihoo360/pika && \
    cd ./pika && \
    make