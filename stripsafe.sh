#!/bin/sh
objcopy --only-keep-debug "$@" "$@".debug

strip --strip-debug "$@"

objcopy --add-gnu-debuglink="$@".debug "$@"
