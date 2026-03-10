#!/data/data/com.termux/files/usr/bin/bash

echo "searching for unstripped binarries and auto strip them"
fd -tf . --batch-size=12 -X file {} | grep 'ELF.*not stripped' | cut -d: -f1 | xargs strip
