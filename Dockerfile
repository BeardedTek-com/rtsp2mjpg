FROM linuxserver/ffmpeg

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get --no-install-recommends -y install \
		python2.7 \
		&& \
    mkdir -p /rtsp2mjpg

COPY --chown=1000:1000 rtsp2mjpg /rtsp2mjpg

ENV SOURCE_URL=rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mp4
ENV MJPG_FPS=5
ENV MJPG_RESOLUTION=-1
ENV JPG_RESOLUTION=-1
WORKDIR /rtsp2mjpg
ENTRYPOINT /rtsp2mjpg/run

EXPOSE 8000
