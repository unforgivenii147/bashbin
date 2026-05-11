#!/data/data/com.termux/files/usr/bin/bash

ruff format --config ~/.config/ruff/ruff.toml --color always .
ruff clean
