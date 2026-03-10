#!/data/data/com.termux/files/usr/bin/bash

zip -FF "$@" --out a.zip
unzip a.zip
rm a.zip
rm *.whl
