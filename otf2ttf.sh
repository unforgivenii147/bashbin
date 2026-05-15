#!/data/data/com.termux/files/usr/bin/bash
for f in *.otf; do
	out="${f%.otf}.ttf"
	fontforge -lang=ff -c "Open(\$1); Generate(\$2);" "$f" "$out"
done
