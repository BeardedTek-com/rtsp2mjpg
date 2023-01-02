FROM linuxserver/ffmpeg

COPY --chown=1000:1000 rtsp2mjpg /rtsp2mjpg

WORKDIR /rtsp2mjpg

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get --no-install-recommends -y install wget

RUN wget https://github.com/mback2k/simple-cgi-server/releases/download/0.2/simple-cgi-server

RUN chmod +x simple-cgi-server

ENV SOURCE_URL=rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mp4
ENV MJPG_FPS=5
ENV MJPG_RESOLUTION=-1
ENV JPG_RESOLUTION=-1

EXPOSE 8000