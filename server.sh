#!/usr/bin/env bash
set -euxo pipefail

./create_example_videos.sh

# start the vlc rtsp server.
# see https://docs.videolan.me/vlc-user/3.0/en/advanced/streaming/rtsp_session.html
# see https://docs.videolan.me/vlc-user/3.0/en/advanced/streaming/stream_over_rtp.html
# see https://wiki.videolan.org/Documentation:Streaming_HowTo/Command_Line_Examples/#RTSP_live_streaming
cvlc -vv \
    --loop \
    --sout-rtp-name 'Example' \
    --sout-rtp-description 'smptebars' \
    --no-sout-audio \
    --sout '#rtp{sdp=rtsp://:8554/smptebars}' \
    smptebars.mp4
