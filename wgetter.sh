#!/bin/sh
WEBSITE="$@"
wget -r -l1 -H -nd -A srt,css,js -R vtt "${WEBSITE}"
