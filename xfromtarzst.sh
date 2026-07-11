#!/data/data/com.termux/files/usr/bin/env python
tar -xvf 0.tar.zst --zstd "$@"
tar --delete -f 0.tar.zst --zstd "$@"
