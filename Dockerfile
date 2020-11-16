FROM golang:1.8-alpine as builder

RUN apk --update add git;
RUN go get -d github.com/aciddude/klar
RUN go build ./src/github.com/aciddude/klar

FROM alpine:3.8

RUN apk add --no-cache ca-certificates
COPY --from=builder /go/klar /klar

ENTRYPOINT ["/klar"]
