#!/data/data/com.termux/files/usr/bin/bash
#for f in *.ttc; do
#	out="${f%.ttc}.ttf"
#	fontforge -lang=ff -c "Open(\$1); Generate(\$2);" "$f" "$out"
#done


DIR="${1:-.}"

# Find all ttc files recursively
find "$DIR" -type f -name "*.ttc" | while read -r ttc_file; do
	ttf_file="${ttc_file%.ttc}.ttf"

	# Skip if TTF already exists
	if [ -f "$ttf_file" ]; then
		echo "⚠ Skipping: $ttc_file (TTF already exists)"
		continue
	fi

	echo "Converting: $ttc_file"

	fontforge -lang=ff -c "
        Open(\"$ttc_file\");
        Generate(\"$ttf_file\");
        Close();
    " 2>/dev/null

	if [ $? -eq 0 ] && [ -f "$ttf_file" ]; then
		echo "  ✓ Created: $ttf_file"
		rm "$ttc_file" # Remove original (optional)
	else
		echo "  ✗ Failed: $ttc_file"
	fi
done

echo "Done!"
