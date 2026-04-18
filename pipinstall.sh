#!/data/data/com.termux/files/usr/bin/bash

pip install "$@"

LAST_PKG=$(pip list --not-required | tail -n1 | awk '{print $1}')

if [ -n "$LAST_PKG" ]; then
	PKG_SIZE=$(pip show "$LAST_PKG" | grep -i location | cut -d' ' -f2 | xargs du -s | cut -f1)
	if [ "$PKG_SIZE" -gt 5000 ]; then
		echo -e "\nLarge package detected. Converting to zip format..."
		zip-pkg "$LAST_PKG"
	fi
fi
