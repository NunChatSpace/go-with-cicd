FROM golang:1.15-alpine as builder
RUN apk --no-cache add tzdata
WORKDIR /app
COPY . .

RUN go mod download
RUN go build -o /go-with-cicd

FROM alpine:3

ARG VERSION
ENV APP__VERSION="${VERSION}"

RUN addgroup -g 1000 appuser && \
  adduser -u 1000 -G appuser -g appuser -s /bin/sh -D appuser

USER appuser

EXPOSE 3000
STOPSIGNAL SIGTERM

CMD ["./lscli", "server", "start"]
