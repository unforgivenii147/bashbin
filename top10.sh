#!/data/data/com.termux/files/usr/bin/bash

du -h --max-depth=1 "$@" | sort -hr | head -n 10
