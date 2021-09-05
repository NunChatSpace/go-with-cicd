FROM golang:1.15-alpine as builder
RUN apk --no-cache add tzdata
WORKDIR /app
COPY . .

RUN go mod download
RUN go build -o /go-with-cicd
