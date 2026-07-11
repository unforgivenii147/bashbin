#!/data/data/com.termux/files/usr/bin/bash

git reflog expire --expire=now --all
git gc --prune=now --aggressive
git repack -a -d --depth=1
