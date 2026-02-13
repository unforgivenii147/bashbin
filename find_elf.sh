#!/bin/sh
echo "searching for unstripped binnaries in current dir"
fd -tf --batch-size=12 -X file {} | grep 'ELF'
