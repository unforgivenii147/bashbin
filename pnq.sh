#!/bin/sh
pngquant --force --verbose --skip-if-larger --strip "$@"
