#!/bin/sh
autoflake --in-place --ignore-init-module-imports --remove-all-unused-imports "$@"
