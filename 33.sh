#!/data/data/com.termux/files/usr/bin/bash

ruff check --config ~/.config/ruff/ruff.toml . --fix --unsafe-fixes
ruff clean
