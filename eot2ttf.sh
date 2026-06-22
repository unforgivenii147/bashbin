#!/data/data/com.termux/files/usr/bin/bash
#for f in *.eot; do
#	out="${f%.eot}.ttf"
#	fontforge -lang=ff -c "Open(\$1); Generate(\$2);" "$f" "$out"
#done

DIR="${1:-.}"

find "$DIR" -type f -name "*.eot" | while read -r eot_file; do
	ttf_file="${eot_file%.eot}.ttf"

	# Skip if TTF already exists
	if [ -f "$ttf_file" ]; then
		echo "⚠ Skipping: $eot_file (TTF already exists)"
		continue
	fi

	echo "Converting: $eot_file"

	fontforge -lang=ff -c "
        Open(\"$eot_file\");
        Generate(\"$ttf_file\");
        Close();
    " 2>/dev/null

	if [ $? -eq 0 ] && [ -f "$ttf_file" ]; then
		echo "  ✓ Created: $ttf_file"
		rm "$eot_file" # Remove original (optional)
	else
		echo "  ✗ Failed: $eot_file"
	fi
done

echo "Done!"
