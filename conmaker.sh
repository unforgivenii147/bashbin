#!/data/data/com.termux/files/usr/bin/bash

chmod +x configure
make clean
./configure --prefix="/data/data/com.termux/files/home/.local"
make -j4
make install
