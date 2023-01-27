[![license](https://img.shields.io/github/license/beardedtek-com/fevr)](https://github.com/BeardedTek-com/rtsp2mjpg/blob/0.1.0/LICENSE)
[![Discussions](https://img.shields.io/github/discussions/beardedtek-com/rtsp2mjpg)](https://github.com/BeardedTek-com/rtsp2mjpg/discussions)
[![telegram](https://img.shields.io/badge/Telegram-@beardedtek-blue)](https://t.me/BeardedTek)
[![twitter-follow](https://img.shields.io/twitter/follow/beardedtek?style=social)](https://twitter.com/intent/user?screen_name=beardedtek)

# rtsp2mjpg
## Converts an rtsp/rtmp stream into an mjpeg stream and jpeg snapshots
Intended to provide OctoPrint with an MJPEG stream and JPG snapshots via an RTSP/RTMP feed.



# A note on security
## ***THERE ARE NO SECURITY MECHANISMS IMPLEMENTED IN THIS SETUP***
### It is up to the user to implement security measures to isolate this server.
### There are no plans to add password protection, ACL's or any other form of protection.
### There are, however, options to add security including nginx, traefik, authelia, and many many more solutions.
### ***USER BEWARE!*** The developers are NOT liable for any security issues imposed by you deploying this solution!

# Features
## Stream mjpg
    - http://<ip>:8000/mjpg.cgi
        - Outputs MJPG Stream via HTTP
## Take snapshot
    - http://<ip>:8000/jpg.cgi
        - Outputs JPG via HTTP
## Take timelapse and save it to timelapse folder
    - http://<ip>:8000/layer.cgi
        - Saves JPG to /data/timelapse for processing
        - This is intended to be used in conjunction with Octoprint.
    - Octoprint Setup:
        - In Octoprint UI:
        - Click on Setup
        - Navigate to Event Manager
        - Add an Event by clicking +Add
        - Select ZChange for Event
        - Enter the following into Command:
            - curl http://<rtsp2mjpg_ip>:<port>/layer.cgi
        - Select 'system' for type
        - Ensure 'Enabled' is checked.
        - Click Close
        - Click Save
        - Restart OctoPrint
        


# Planned Features (Not yet implemented)
## Generate timelapse video
    - http://<ip>:8000/timelapse.cgi
        - This will eventually generate a timelapse from snapshots in /data/timelapse folder

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