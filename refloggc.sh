#!/data/data/com.termux/files/usr/bin/bash
#LAZY_DIR=~/.local/share/nvim/lazy

#for repo in "$LAZY_DIR"/*/; do
#  if [ -d "$repo/.git" ]; then
#    echo "Processing $repo"
#    cd "$repo" || continue
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git repack -a -d --depth=1

#  fi
#done
