[![license](https://img.shields.io/github/license/beardedtek-com/fevr)](https://github.com/BeardedTek-com/rtsp2mjpg/blob/0.1.0/LICENSE)
[![Discussions](https://img.shields.io/github/discussions/beardedtek-com/rtsp2mjpg)](https://github.com/BeardedTek-com/rtsp2mjpg/discussions)
[![telegram](https://img.shields.io/badge/Telegram-@beardedtek-blue)](https://t.me/BeardedTek)
[![twitter-follow](https://img.shields.io/twitter/follow/beardedtek?style=social)](https://twitter.com/intent/user?screen_name=beardedtek)

# rtsp2mjpg
## Converts an rtsp/rtmp stream into an mjpeg stream and jpeg snapshots
Intended to provide OctoPrint with an MJPEG stream and JPG snapshots via an RTSP/RTMP feed.

# Install
## docker-compose is the preferred method

### Clone this repository
```
git clone https://github.com/beardedtek-com/rtsp2mjpg
```

### Create .env file
```
cp example.env .env
```

### Edit .env file
Edit the contents of the .env file
SOURCE_URL can be any valid video source (or should be able to)
ffmpeg will automatically scale the resolution according to the original's aspect ratio.
```
MJPG_RESOLUTION=720
MJPG_FPS=5
JPG_RESOLUTION=720
SOURCE_URL=rtsp://WYZE-BRIDGE:8554/camera-name
```

### Bring it all up!
```
docker-compose up -d
```

### Access MJPG Stream
http://<hostname>:8880/cgi-bin/mjpg.cgi

### Access Screenshot
http://<hostname>:8880/cgi-bin/jpg.cgi

# Support
No support is implied.  This worked when I wrote it and I intend to update it as I have time.
Feel free to submit a PR or an issue if something doesn't work, but this is low on my priority list unless it breaks for me.

Feel free to fork this and submit a PR.  I will get to it eventually.