#!/bin/bash

echo "Content-Type: multipart/x-mixed-replace;boundary=ffmpeg"
echo "Cache-Control: no-cache"
echo ""
ffmpeg -i "${SOURCE_URL}" -c:v mjpeg -vf "fps=${MJPG_FPS}, scale='-1:${MJPG_RESOLUTION}'" -q:v 1 -f mpjpeg -an -
