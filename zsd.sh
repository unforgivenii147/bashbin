#!/bin/sh
zstd --rm --ultra -19 --progress --format=zstd "$@"
