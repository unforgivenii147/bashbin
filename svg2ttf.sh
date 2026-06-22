#!/data/data/com.termux/files/usr/bin/bash
#for f in *.svg; do
#	out="${f%.svg}.ttf"
#	fontforge -lang=ff -c "Open(\$1); Generate(\$2);" "$f" "$out"
#done


DIR="${1:-.}"

# Find all svg files recursively
find "$DIR" -type f -name "*.svg" | while read -r svg_file; do
	ttf_file="${svg_file%.svg}.ttf"

	# Skip if TTF already exists
	if [ -f "$ttf_file" ]; then
		echo "⚠ Skipping: $svg_file (TTF already exists)"
		continue
	fi

	echo "Converting: $svg_file"

	fontforge -lang=ff -c "
        Open(\"$svg_file\");
        Generate(\"$ttf_file\");
        Close();
    " 2>/dev/null

	if [ $? -eq 0 ] && [ -f "$ttf_file" ]; then
		echo "  ✓ Created: $ttf_file"
		rm "$svg_file" # Remove original (optional)
	else
		echo "  ✗ Failed: $svg_file"
	fi
done

echo "Done!"
