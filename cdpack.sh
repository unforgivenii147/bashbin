#!/data/data/com.termux/files/usr/bin/bash

for f in *; do bash -c "cd $f && wheel pack ."; done
