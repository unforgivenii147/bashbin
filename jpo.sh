#!/data/data/com.termux/files/usr/bin/bash

fd -e JPG -e JPEG -e jpg -e jpeg --batch-size=12 -X jpegoptim -f -m 50 --max 70 --threshold 0.5 --strip-all -w8 {}
