#!/data/data/com.termux/files/usr/bin/bash

strip_elf() {
	objcopy --only-keep-debug "$@" "$@".debug
	strip --strip-debug "$@"
	objcopy --add-gnu-debuglink="$@".debug "$@"
}

strip_elf "$@"
