#!/bin/sh
# Use a swap file
dd if=/dev/zero of=/data/data//swap bs=1024 count=524288
chmod 600 /sdcard/swap
mkswap /sdcard/swap 


&
swapon /sdcard/swap &

