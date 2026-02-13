ffmpeg -i input.mp4 \
	-c:v libx265 -preset veryslow -crf 32 \
	-vf scale=480:-2 -r 24 \
	-c:a aac -b:a 64k -ac 1 \
	output_whatsapp.mp4
