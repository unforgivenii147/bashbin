#!/data/data/com.termux/files/usr/bin/bash
version="1.4 7"
usage="example usage: uncompress file.gz"
case $1 in
--help)
	printf '%s\n' "$usage" || exit 1
	exit
	;;
--version)
	printf '%s\n' "$version" || exit 1
	exit
	;;
esac
exec gzip -d "$@"

