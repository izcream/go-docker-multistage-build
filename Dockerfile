FROM golang:alpine as builder


WORKDIR /
COPY . .
RUN go mod download
RUN go build -o myapp main.go

FROM alpine:latest

ARG USER=app

ENV TZ=Asia/Bangkok

RUN adduser -D $USER

USER $USER
WORKDIR /app
COPY --from=builder /myapp /app/myapp
EXPOSE 3000
CMD ["./myapp"]