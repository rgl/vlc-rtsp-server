#!/usr/bin/env bash
set -euxo pipefail

# download and install the latest version of ffmpeg.
if [ ! -f ffmpeg/ffmpeg ]; then
    if [ ! -f ffmpeg-release-amd64-static.tar.xz ]; then
        wget -qO ffmpeg-release-amd64-static.tar.xz \
            https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz
    fi
    rm -rf ffmpeg
    install -d ffmpeg
    tar -xJf ffmpeg-release-amd64-static.tar.xz --strip-components 1 -C ffmpeg
fi

# create example video.
./ffmpeg/ffmpeg \
    -f lavfi \
    -i 'smptebars=duration=120:size=640x360:rate=30' \
    -filter:v "drawtext=text='%{pts\\:hms} #%{n}':x=-5:y=3:fontsize=53:fontcolor=white:box=1:boxborderw=3:boxcolor=black:fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf" \
    -c:v libx264 \
    -profile:v baseline \
    -pix_fmt yuv420p \
    -preset ultrafast \
    -tune stillimage \
    -movflags +faststart \
    -b:v 600k \
    smptebars.mp4
