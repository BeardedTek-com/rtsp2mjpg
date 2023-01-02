
FROM ghcr.io/home-assistant/amd64-base-python:3.10-alpine3.15

COPY root /

WORKDIR /rtsp2mjpg

RUN apk --no-cache add \
        wget \
		ffmpeg && \
	wget -O /rtsp2mjpg/simple-cgi-server https://github.com/mback2k/simple-cgi-server/releases/download/0.2/simple-cgi-server && \
	chmod +x /rtsp2mjpg/simple-cgi-server && \
	chown -R 1000:1000 /rtsp2mjpg

ENV SOURCE_URL=rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mp4
ENV MJPG_FPS=5
ENV MJPG_RESOLUTION=-1
ENV JPG_RESOLUTION=-1

EXPOSE 8000