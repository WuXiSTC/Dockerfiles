FROM alpine

ENV PIKA_ROOT /pika
ENV PIKA_FILE pika.tar.bz2
ENV PIKA_URL https://github.com/Qihoo360/pika/releases/download/v3.2.6/pika-linux-x86_64-v3.2.6.tar.bz2
RUN wget -O ${PIKA_FILE} ${PIKA_URL} && \
    mkdir ${PIKA_ROOT} && \
    tar -jxvf ${PIKA_FILE} -C ${PIKA_ROOT} && \
    rm -f ${PIKA_FILE}