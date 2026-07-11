#!/data/data/com.termux/files/usr/bin/bash
gh repo create "$@" --public --source=. --remote=origin --push
