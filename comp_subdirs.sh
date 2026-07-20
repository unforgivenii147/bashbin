#!/data/data/com.termux/files/usr/bin/env bash
# compress_dirs_ultra_parallel.sh

set -euo pipefail

# Check dependencies
command -v pixz &>/dev/null || {
	echo "Install pixz"
	exit 1
}
command -v parallel &>/dev/null || {
	echo "Install GNU parallel"
	exit 1
}

# Detect CPU cores
CORES=$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)
THREADS_PER_JOB=$((CORES / 2))
[[ $THREADS_PER_JOB -lt 1 ]] && THREADS_PER_JOB=1

echo "🧠 Using $CORES cores, $THREADS_PER_JOB threads per archive"

compress_dir() {
	local dir="$1"
	local dir_name="${dir#./}"
	local archive="${dir_name}.tar.xz"
	local threads="$2"

	[[ -f "$archive" ]] && {
		echo "⏭️ Skip: $dir_name"
		return 0
	}

	echo "🔄 $dir_name"

	# Use specified threads for pixz
	if tar -cf - -C "$dir_name" . 2>/dev/null | pixz -9 -t "$threads" >"$archive" 2>/dev/null; then
		if tar -tf "$archive" &>/dev/null; then
			rm -rf "$dir_name"
			echo "✅ $dir_name → $(du -h "$archive" | cut -f1)"
			return 0
		fi
	fi

	echo "❌ Failed: $dir_name"
	rm -f "$archive"
	return 1
}

export -f compress_dir

# Get directories (non-recursive)
find . -maxdepth 1 -mindepth 1 -type d ! -name ".*" -printf "%P\n" |
	parallel -j${CORES} --bar --eta compress_dir {} $THREADS_PER_JOB

echo "✅ Complete!"
