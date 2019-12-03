FROM alpine

ENV PIKA_VERSION v3.2.7

RUN apk add git && \
    git clone --branch ${PIKA_VERSION} https://github.com/Qihoo360/pika && \
    cd pika && \
    make

FROM alpine

ENV PIKA_ROOT /pika
COPY --from=0 /pika/output/bin/pika ${PIKA_ROOT}
COPY --from=0 /pika/conf/pika.conf /
ENV PATH ${PIKA_ROOT}:${PATH}

CMD [ "pika","-c","/pika.conf" ]