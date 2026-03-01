#!/bin/sh
export VERBOSE=1
PYTHONDONTWRITEBYTECOMPILE=1 python -m pip install --no-deps "$@"
