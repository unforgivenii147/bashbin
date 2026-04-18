#!/data/data/com.termux/files/usr/bin/bash

find /data/data/com.termux/files/usr/lib/python3.12/site-packages -type f -name \*.pyc -execdir rm -v {} \;
find /data/data/com.termux/files/home -type f -name \*.pyc -execdir rm -v {} \;
find /sdcard -type f -name \*.pyc -execdir rm -v {} \;
