#!/bin/sh
for f in *.py; do python -O -m py_compile $f; done
