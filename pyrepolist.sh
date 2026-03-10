#!/data/data/com.termux/files/usr/bin/bash

gh repo list $@ --json name,description,url,language | jq -r '.[] | select(.language=="Python") | .name'
