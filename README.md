# About

**WARNING this is not working.**

Use the VLC RTSP server to stream a MP4 file.

As an alternative, you can use https://github.com/rgl/mediamtx-rtsp-server.

# Usage (Ubuntu Desktop 22.04)

Install VLC:

```bash
# remove the debian/ubuntu package.
# NB it does not support RTSP due to live555 licensing concerns.
sudo apt-get remove -y --purge 'vlc*'
# install the snap package.
sudo snap install vnc
hash -r
```

Start the RTSP server:

```bash
./server.sh
```

In another shell, start the VLC RTSP client:

```bash
./client.sh
```
