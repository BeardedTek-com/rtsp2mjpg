FROM golang:1.17.7-alpine3.15 as build
RUN apk --no-cache --update upgrade && apk --no-cache add git build-base
RUN cd /go && git clone https://github.com/mback2k/simple-cgi-server.git
WORKDIR /go/simple-cgi-server

RUN go get
RUN go build -ldflags="-s -w"
RUN chmod +x simple-cgi-server

FROM ghcr.io/home-assistant/amd64-base-python:3.10-alpine3.15
RUN apk --no-cache --update upgrade && apk --no-cache add ca-certificates bash ffmpeg

COPY --from=build /go/simple-cgi-server/simple-cgi-server /usr/local/bin/simple-cgi-server

RUN addgroup -g 8080 -S serve
RUN adduser -u 8080 -h /data -S -D -G serve serve
COPY etc /etc
COPY --chown=8080:8080 rtsp2mjpg /data

WORKDIR /data
USER serve

EXPOSE 8000

ENV MJPG_RESOLUTION=-1
ENV MJPG_FPS=5
ENV JPG_RESOLUTION=-1
ENV SOURCE_URL=rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mp4

