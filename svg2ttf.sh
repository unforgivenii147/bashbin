#!/data/data/com.termux/files/usr/bin/bash
for f in *.svg; do
	out="${f%.svg}.ttf"
	fontforge -lang=ff -c "Open(\$1); Generate(\$2);" "$f" "$out"
done
