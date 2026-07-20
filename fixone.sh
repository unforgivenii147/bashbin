#!/data/data/com.termux/files/usr/bin/env bash
# Quick script to reorganize
for pyc in *.pyc; do
	module="${pyc%.pyc}"
	mkdir -p "__pycache__"
	mv "$pyc" "__pycache__/${module}.cpython-312.pyc"
	# Create empty stub (optional)
	touch "${module}.py"
done
