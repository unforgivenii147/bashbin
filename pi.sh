#!/bin/sh
#python -m pip install --no-deps "$@"

PYTHONDONTWRITEBYTECOMPILE=1 python -m pip install --no-deps "$@"
