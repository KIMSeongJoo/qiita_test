## go lang install
FROM golang:1.14.2-alpine3.11

## pakcage update & install
RUN apk add --update curl git pkgconfig curl-dev  &&  \
    go get github.com/cespare/reflex

## timezone update
RUN apk add tzdata
ENV TZ=Asia/Tokyo

## setting enviroment variables
ENV GO111MODULE "on"
ENV ENV "prod"

## source code copy
WORKDIR /go
COPY . /go/src

## module install
WORKDIR /go/src
RUN go install

## go build
RUN go build ./main.go

## container listen port
EXPOSE 80

## command
## start
CMD ["./main"]