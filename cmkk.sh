#!/data/data/com.termux/files/usr/bin/bash

./configure
make -j8
make install
meson . build
cd build
ninja
ninja install
