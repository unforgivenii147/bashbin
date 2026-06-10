#!/data/data/com.termux/files/usr/bin/bash

ruff format "${@:-.}"
ruff clean
