#!/data/data/com.termux/files/usr/bin/bash

xz -z -e -11 --threads=4 --block-size=32768 -v "$@"
