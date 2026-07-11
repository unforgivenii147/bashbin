#!/data/data/com.termux/files/usr/bin/bash

yes | find . -type f -name \*.zst -not -name \*.tar.zst -execdir zstd --rm -d {} \;
