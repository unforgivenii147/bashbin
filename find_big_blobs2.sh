#!/data/data/com.termux/files/usr/bin/env bash
git log -S 100000 --all -p -- '*.bin' # search for commits affecting 100KB+ files
git diff HEAD~10 HEAD --stat # see file size changes in last 10 commits
