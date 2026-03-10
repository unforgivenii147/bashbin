#!/data/data/com.termux/files/usr/bin/bash

export PATH=$(echo "$PATH" | awk -v RS=: -v ORS=: '!a[$1]++' | sed 's/:$//')
