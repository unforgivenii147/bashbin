#!/data/data/com.termux/files/usr/bin/bash

find . -type f -name \*.jpeg -execdir jpegoptim -f -m 65 --max 85 --threshold 0.7 --strip-all -w8 {} \;
find . -type f -name \*.jpg -execdir jpegoptim -f -m 65 --max 85 --threshold 0.7 --strip-all -w8 {} \;
