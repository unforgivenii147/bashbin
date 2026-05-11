#!/data/data/com.termux/files/usr/bin/bash
for f in `fd -e woff -e ttf -e otf -e eot`; do
  out="${f%.woff}.woff2"
  fontforge -lang=ff -c "Open(\$1); Generate(\$2);" "$f" "$out"
done

