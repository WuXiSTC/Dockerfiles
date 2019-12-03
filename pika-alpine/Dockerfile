FROM debian:buster

ENV PIKA_VERSION v3.2.7

ENV PIKA_ROOT /pika
ENV PIKA_FILE pika.tar.bz2
ENV PIKA_URL https://github.com/Qihoo360/pika/releases/download/${PIKA_VERSION}/pika-linux-x86_64-${PIKA_VERSION}.tar.bz2
RUN wget -O ${PIKA_FILE} ${PIKA_URL} && \
    mkdir ${PIKA_ROOT} && \
    tar -jxvf ${PIKA_FILE} -C ${PIKA_ROOT} && \
    rm -f ${PIKA_FILE}
ENV PATH ${PIKA_ROOT}/output/bin:${PATH}
