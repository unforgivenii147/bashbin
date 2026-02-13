#!/bin/sh
echo "searching for unstripped binnaries in current dir"
fd -t f . --batch-size=12 -X file {} | grep 'ELF.*not stripped'
