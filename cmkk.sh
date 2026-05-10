#!/data/data/com.termux/files/usr/bin/bash

./configure --prefix=#/data/data/com.termux/files/home/.local

make -j4
make install

meson . build
cd build
ninja
ninja install
