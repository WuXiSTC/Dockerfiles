FROM debian:buster

ENV PIKA_VERSION v3.2.7

ADD ./pika /pika

RUN apt-get update && \
    apt-get install -y git libsnappy-dev libgoogle-glog-dev g++ make && \
    # git clone -b ${PIKA_VERSION} --single-branch --recurse-submodules https://github.com/Qihoo360/pika && \
    cd pika && \
    make