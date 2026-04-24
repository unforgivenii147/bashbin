#!/data/data/com.termux/files/usr/bin/bash

ruff --config ~/.config/ruff/ruff.toml check --fix --unsafe-fixes --diff .
ruff clean
