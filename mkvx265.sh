ffmpeg -i "$@" \
	-c:v libx265 -preset veryslow -crf 30 \
	-vf scale=854:-1 \
	-c:a aac -b:a 64k \
	output_480p_x265.mp4
