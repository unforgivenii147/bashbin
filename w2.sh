#!/data/data/com.termux/files/usr/bin/bash

python setup.py bdist_wheel
pip install dist/*.whl --no-deps --verbose

