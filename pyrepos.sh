#!/data/data/com.termux/files/usr/bin/bash

gh repo list $@ --json name,stargazerCount,languages |
	jq -r '.[] | select(.languages=="Python") | "\(.stargazerCount) \(.name)"' |
	sort -rn | awk '{print $2}'
