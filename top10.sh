#!/bin/sh
du -h --max-depth=1 "$@" | sort -hr | head -n 10
