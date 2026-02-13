#!/bin/sh
fd -e pyc --batch-size=99 -X rm -v {}
fd -td __pycache__ -x rm -rfv {}
