#!/bin/sh

echo "Content-type: image/jpeg"
echo ""
echo "$(date +%s) - Converting ${SOURCE_URL} to JPG with a height of ${JPG_RESOLUTION}" 1>&2
ffmpeg -hide_banner -loglevel error -y -i "${SOURCE_URL}" -vf scale="-1:${JPG_RESOLUTION}" -r 1 -vframes 1 /tmp/snapshot.jpg
cat /tmp/snapshot.jpg
