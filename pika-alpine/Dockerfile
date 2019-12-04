FROM frolvlad/alpine-glibc

ENV PIKA_ROOT /opt/pika

ENV PIKA_FILE pika.tar.bz2
ENV PIKA_URL https://github.com/Qihoo360/pika/releases/download/v3.2.6/pika-linux-x86_64-v3.2.6.tar.bz2

RUN apk add --no-cache libbz2 rsync && \
    wget -O ${PIKA_FILE} ${PIKA_URL} && \
    mkdir ${PIKA_ROOT} && \
    tar -jxvf ${PIKA_FILE} -C ${PIKA_ROOT} && \
    rm -f ${PIKA_FILE} && \
    mv ${PIKA_ROOT}/output/* ${PIKA_ROOT} && \
    rm -rf ${PIKA_FILE}/output

ENV PATH ${PIKA_ROOT}/bin:${PATH}

WORKDIR /pika
VOLUME [ "/pika" ]
EXPOSE 9221

CMD pika -c ${PIKA_ROOT}/conf/pika.conf