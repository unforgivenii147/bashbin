#!/data/data/com.termux/files/usr/bin/bash
gs -dSAFER -dBATCH -dNOPAUSE -sDEVICE=jpeg -r300 -sOutputFile=page%d.jpg "$@"
