#!/data/data/com.termux/files/usr/bin/python
parallel --gnu -j-2 --eta brotli ::: "$@"
