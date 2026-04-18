#!/data/data/com.termux/files/usr/bin/bash

shuf "$@" >temp
mv temp "$@"
