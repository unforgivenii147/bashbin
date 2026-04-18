#!/data/data/com.termux/files/usr/bin/bash
chmod +x configure
./configure
make -j4
make install
