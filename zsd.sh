#!/bin/sh
zstd --rm --ultra -22 --progress --format=lzma "$@"
