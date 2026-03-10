#!/data/data/com.termux/files/usr/bin/bash

objcopy --only-keep-debug "$@" "$@".debug

strip --strip-debug "$@"

objcopy --add-gnu-debuglink="$@".debug "$@"
