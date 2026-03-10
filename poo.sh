#!/data/data/com.termux/files/usr/bin/bash

python -m pip install --no-deps \
	--no-build-isolations \
	--upgrade \
	--force-reinstall \
	--verbose "$@"
