#!/bin/sh

unlink_recursive() {
	path="$1"

	for entry in "$path"/* "$path"/.[!.]* "$path"/..?*; do
		case "$entry" in
		*'*'* | *'?'*) continue ;;
		esac
		unlink_recursive "$entry"
	done 2>/dev/null

	if rmdir "$path" 2>/dev/null; then
		:
	elif unlink "$path" 2>/dev/null; then
		:
	else
		:
	fi
}

for target in "$@"; do
	echo "Unlinking broken symlinks..."
	unlink_recursive "$target"
done

busybox rm "$@"
