#!/bin/sh
PYTHONDONTWRITEBYTECOMPILE=1 python -m pip install --no-deps --force-reinstall "$@"
