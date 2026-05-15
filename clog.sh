#!/bin/sh
cleanlog() {
	if [ -f "$1" ]; then
		sed 's/\x1b\[[0-9;]*[a-zA-Z]//g' "$1" | col -b >"${1}_cleaned.log"
		echo "Cleaned log saved to ${1}_cleaned.log"
	else
		echo "File not found."
	fi
}

cleanlog
