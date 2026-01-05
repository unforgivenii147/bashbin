#!/bin/sh
strip_elf() {
	objcopy --only-keep-debug "$@" \
		"$@".debug
	strip --strip-debug "$@"
	objcopy --add-gnu-debuglink="$@".debug \
		"$@"
}

echo "searching for unstripped binarries and auto strip them"
fd -t f . -x file {} |
	rg 'ELF.*not stripped' |
	cut -d: -f1 |
	xargs strip_elf
