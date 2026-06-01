ffmpeg -i "$@" \
	-c:v libx265 -preset veryfast -crf 32 \
	-vf scale=480:-2 -r 24 \
	-c:a aac -b:a 64k -ac 1 \
	output.mp4
