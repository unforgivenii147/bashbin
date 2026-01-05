#!/bin/sh
python -m pip install --no-deps \
	--no-build-isolations \
	--upgrade \
	--force-reinstall \
	--verbose "$@"
