#!/data/data/com.termux/files/usr/bin/bash

ruff --isolated check --fix --unsafe-fixes .
ruff clean
