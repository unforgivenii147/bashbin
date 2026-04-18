#!/data/data/com.termux/files/usr/bin/bash

ruff --isolated check --fix --unsafe-fixes --diff .
ruff clean
