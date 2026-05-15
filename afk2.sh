#!/data/data/com.termux/files/usr/bin/bash

autoflake --in-place --ignore-init-module-imports --remove-all-unused-imports -r -j 4 .
