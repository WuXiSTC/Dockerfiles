FROM golang:alpine

WORKDIR /go/src
RUN apk --update add git && \
    go get -d -v github.com/kataras/iris && \
    go get -d -v github.com/go-sql-driver/mysql && \
    go get -d -v github.com/gocql/gocql && \
    go get -d -v github.com/garyburd/redigo/redis && \
    go get -d -v gopkg.in/yaml.v3
RUN mkdir /app
WORKDIR /app
VOLUME  ["/app"]