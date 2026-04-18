#!/data/data/com.termux/files/usr/bin/bash

set -e

comp_dir() {
	local name="$(basename "$PWD")"
	local archive="../${name}.tar.xz"

	echo "🗜️ Compressing '$name' into '$archive' (xz -e -9)..."
	tar -cf "$archive" -C .. "$name" || {
		echo "❌ Compression failed."
		return 1
	}

	cd .. || {
		echo "❌ Failed to change directory."
		return 1
	}
	rm -rf "$name"
	xzz "${name}.tar"

	echo "✅ Done: created '$archive' and removed '$name/'"
}

comp_dir
