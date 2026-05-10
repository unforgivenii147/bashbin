#!/data/data/com.termux/files/usr/bin/bash

echo "searching for ELF files ..."

fd -tf --batch-size=32 -X file {} | grep 'ELF'
