FROM golang:alpine

WORKDIR /go/src
RUN apk --update add git && \
    go get -d -v github.com/kataras/iris && \
    go get -d -v github.com/go-sql-driver/mysql && \
    go get -d -v github.com/garyburd/redigo/redis
VOLUME  ["/go/src"]
#ENTRYPOINT [ "go" ]