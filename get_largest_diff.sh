#!/data/data/com.termux/files/usr/bin/bash
git rev-list --all |
	while read c; do
		echo "$(git show --format= --numstat "$c" | wc -c) $c"
	done |
	sort -nr |
	head -20
