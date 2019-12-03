FROM debian:buster

ENV PIKA_VERSION v3.2.7

ENV PIKA_FILE /pika.tar.bz2
ENV PIKA_URL https://github.com/Qihoo360/pika/releases/download/${PIKA_VERSION}/pika-linux-x86_64-${PIKA_VERSION}.tar.bz2

RUN apt-get update && \
    apt-get install -y wget bzip2 && \
    wget -O ${PIKA_FILE} ${PIKA_URL} && \
    mkdir /pika && \
    tar -jxvf ${PIKA_FILE} -C /pika


FROM debian:buster

ENV PIKA_ROOT /opt/pika

COPY --from=0 /pika/output ${PIKA_ROOT}

ENV PATH ${PIKA_ROOT}/bin:${PATH}

RUN apt-get update && \
    apt-get install -y rsync && \
    apt-get clean

WORKDIR /pika

VOLUME [ "/pika" ]

EXPOSE 9221

CMD pika -c ${PIKA_ROOT}/conf/pika.conf