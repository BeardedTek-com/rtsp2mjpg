#!/usr/bin/env bash

echo "Content-Type: multipart/x-mixed-replace;boundary=ffmpeg"
echo "Cache-Control: no-cache"
echo ""
echo "$(date +%s) - Converting ${SOURCE_URL} to MJPG stream with a height of ${JPG_RESOLUTION}" 1>&2
ffmpeg -hide_banner -loglevel error -i "${SOURCE_URL}" -c:v mjpeg -vf "fps=5, scale='-1:${JPG_RESOLUTION}'" -q:v 1 -f mpjpeg -an -