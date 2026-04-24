#!/data/data/com.termux/files/usr/bin/bash

ruff --isolated check --fix --unsafe-fixes --ignore PLR0912,D .
ruff clean
