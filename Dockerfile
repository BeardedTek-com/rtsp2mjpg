
FROM ghcr.io/home-assistant/amd64-base-python:3.10-alpine3.15

RUN apk --no-cache add \
        wget \
		ffmpeg

COPY root /

RUN mkdir /rtsp2mjpg

COPY --chown=1000:1000 rtsp2mjpg /rtsp2mjpg

RUN adduser -D -s /bin/bash -u 1000 rtsp2mjpg

RUN	wget -O /usr/local/bin/simple-cgi-server https://github.com/mback2k/simple-cgi-server/releases/download/0.2/simple-cgi-server

RUN chmod +x /usr/local/bin/simple-cgi-server

ENV SOURCE_URL=rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mp4
ENV MJPG_FPS=5
ENV MJPG_RESOLUTION=-1
ENV JPG_RESOLUTION=-1

EXPOSE 8000