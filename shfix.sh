#!/data/data/com.termux/files/usr/bin/python
shellcheck -f diff "$@" | patch -p1
