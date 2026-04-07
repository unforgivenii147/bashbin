#!/data/data/com.termux/files/usr/bin/bash

python -m ruff format --config ~/.config/ruff/ruff.toml .
ruff clean
