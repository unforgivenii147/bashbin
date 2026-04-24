#!/data/data/com.termux/files/usr/bin/bash

ruff --isolated check --fix --unsafe-fixes --diff --ignore PLR0912,D .
ruff clean
