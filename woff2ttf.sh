#!/data/data/com.termux/files/usr/bin/bash
#for f in *.woff; do
#	out="${f%.woff}.ttf"
#	fontforge -lang=ff -c "Open(\$1); Generate(\$2);" "$f" "$out"
#done

DIR="${1:-.}"

# Find all woff files recursively
find "$DIR" -type f -name "*.woff" | while read -r woff_file; do
	ttf_file="${woff_file%.woff}.ttf"

	# Skip if TTF already exists
	if [ -f "$ttf_file" ]; then
		echo "⚠ Skipping: $woff_file (TTF already exists)"
		continue
	fi

	echo "Converting: $woff_file"

	fontforge -lang=ff -c "
        Open(\"$woff_file\");
        Generate(\"$ttf_file\");
        Close();
    " 2>/dev/null

	if [ $? -eq 0 ] && [ -f "$ttf_file" ]; then
		echo "  ✓ Created: $ttf_file"
		rm "$woff_file" # Remove original (optional)
	else
		echo "  ✗ Failed: $woff_file"
	fi
done

echo "Done!"
