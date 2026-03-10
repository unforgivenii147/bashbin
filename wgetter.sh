#!/data/data/com.termux/files/usr/bin/bash

WEBSITE="$@"
wget -r -l1 -H -nd -A srt,css,js -R vtt "${WEBSITE}"
