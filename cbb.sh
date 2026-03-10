#!/data/data/com.termux/files/usr/bin/bash

for f in *.py; do python -O -m py_compile $f; done
