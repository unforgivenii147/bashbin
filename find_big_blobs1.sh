#!/data/data/com.termux/files/usr/bin/env bash
git rev-list --all --objects | sed -n '$(wc -l <&0)p;e wc -l' |
	sort -k1 -n -r | head -20 | while read size object; do
	echo "$size $(git log --oneline --all -- $object | head -1)"
done
