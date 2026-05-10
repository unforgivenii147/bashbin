#!/data/data/com.termux/files/usr/bin/bash
for f in *.woff; do
  out="${f%.woff}.ttf"
  fontforge -lang=ff -c "Open(\$1); Generate(\$2);" "$f" "$out"
done
