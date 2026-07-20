#!/data/data/com.termux/files/usr/bin/bash
#for f in *.ttx; do
#	out="${f%.ttx}.ttf"
#	fontforge -lang=ff -c "Open(\$1); Generate(\$2);" "$f" "$out"
#done

DIR="${1:-.}"

# Find all ttx files recursively
find "$DIR" -type f -name "*.ttx" | while read -r ttx_file; do
	ttf_file="${ttx_file%.ttx}.ttf"

	# Skip if TTF already exists
	if [ -f "$ttf_file" ]; then
		echo "⚠ Skipping: $ttx_file (TTF already exists)"
		continue
	fi

	echo "Converting: $ttx_file"

	fontforge -lang=ff -c "
        Open(\"$ttx_file\");
        Generate(\"$ttf_file\");
        Close();
    " 2>/dev/null

	if [ $? -eq 0 ] && [ -f "$ttf_file" ]; then
		echo "  ✓ Created: $ttf_file"
		rm "$ttx_file" # Remove original (optional)
	else
		echo "  ✗ Failed: $ttx_file"
	fi
done

echo "Done!"
