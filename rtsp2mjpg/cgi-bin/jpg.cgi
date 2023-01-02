#!/bin/sh
echo "Content-type: image/jpeg\n"
ffmpeg -y -i "${SOURCE_URL}" -vf scale="-1:${JPG_RESOLUTION}" -r 1 -vframes 1 /tmp/snapshot.jpg
cat /tmp/snapshot.jpg
