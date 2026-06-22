#!/data/data/com.termux/files/usr/bin/bash
# Convert OTF to TTF recursively using FontForge
# Usage: ./otf2ttf_fontforge.sh [directory]

DIR="${1:-.}"

# Find all OTF files recursively
find "$DIR" -type f -name "*.otf" | while read -r otf_file; do
	ttf_file="${otf_file%.otf}.ttf"

	# Skip if TTF already exists
	if [ -f "$ttf_file" ]; then
		echo "⚠ Skipping: $otf_file (TTF already exists)"
		continue
	fi

	echo "Converting: $otf_file"

	fontforge -lang=ff -c "
        Open(\"$otf_file\");
        Generate(\"$ttf_file\");
        Close();
    " 2>/dev/null

	if [ $? -eq 0 ] && [ -f "$ttf_file" ]; then
		echo "  ✓ Created: $ttf_file"
		rm "$otf_file" # Remove original (optional)
	else
		echo "  ✗ Failed: $otf_file"
	fi
done

echo "Done!"
