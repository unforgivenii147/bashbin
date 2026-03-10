#!/data/data/com.termux/files/usr/bin/bash

export VERBOSE=1
PYTHONDONTWRITEBYTECOMPILE=1 python -m pip install --upgrade --no-deps --force-reinstall "$@"
