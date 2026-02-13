#!/data/data/com.termux/files/usr/bin/bash
cd "$PREFIX"
cd ..
fd -e pyc -e bak --batch-size=12 -X rm -v {}
