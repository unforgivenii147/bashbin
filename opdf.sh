#!/bin/bash

# Check if input file is provided
if [ $# -eq 0 ]; then
	echo "Usage: $0 input.pdf"
	exit 1
fi

input_file="$1"
temp_file="temp_${input_file}"

# Run Ghostscript and save output to a temporary file
gs \
	-sDEVICE=pdfwrite \
	-dCompatibilityLevel=1.4 \
	-dDownsampleColorImages=true \
	-dDownsampleGrayImages=true \
	-dDownsampleMonoImages=true \
	-dColorImageResolution=72 \
	-dGrayImageResolution=72 \
	-dMonoImageResolution=72 \
	-dColorImageDownsampleType=/Bicubic \
	-dGrayImageDownsampleType=/Bicubic \
	-dMonoImageDownsampleType=/Subsample \
	-dNOPAUSE -dBATCH -dQUIET \
	-sOutputFile="$temp_file" \
	"$input_file"

# Replace the original file with the temporary file
mv -iv "$temp_file" "$input_file"
echo "pdf file shrinked"
