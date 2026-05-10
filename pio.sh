#!/data/data/com.termux/files/usr/bin/bash

export PYTHONDONTWRITEBYTECOMPILE=1
python -m pip install --no-deps --force-reinstall "$@"
rm "$@"
