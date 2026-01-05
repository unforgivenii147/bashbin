#!/bin/sh
spkg
python -O -m compileall -j 8 -f pip wheel setuptools regex cython packaging
