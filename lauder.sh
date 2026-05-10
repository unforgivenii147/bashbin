#!/bin/sh
FNAME="$@"
# ffmpeg -i "$FNAME" -af "volume=2.0" -c:a aac -b:a 128k "${FNAME}_1.mp4"
ffmpeg -i "$FNAME" -af "volume=2.0" "${FNAME}_1.mp4"
