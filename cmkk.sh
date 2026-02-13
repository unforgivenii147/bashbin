#!/bin/sh
./configure
make -j8
make install
meson . build
cd build
ninja
ninja install
