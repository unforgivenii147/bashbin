#!/bin/sh
fd -t f -x sh -c 'file "$1" | rg -q "ELF" && file "$1"' sh {} | rg 'not stripped'
