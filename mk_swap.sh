#!/bin/sh
# Use a swap file
dd if=/dev/zero of=/data/data/com.termux/files/usr/tmp/swap bs=1024 count=524288
chmod 600 /data/data/com.termux/files/usr/tmp/swap
mkswap /data/data/com.termux/files/usr/tmp/swap &
swapon /data/data/com.termux/files/usr/tmp/swap
