#!/data/data/com.termux/files/usr/bin/env bash


name="$(basename "$PWD")"
cd ..
cd  "$name"
cd ..
rm -rf "$name"
echo "target removed."
cd ..
