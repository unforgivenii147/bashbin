#!/data/data/com.termux/files/usr/bin/env bash
psevenz() {
	local name="$(basename "$PWD")"
	local archive="../${name}.7z"

	echo "🗜️ Compressing '$name' into '$archive'..."
	7z a -mx9 "$archive" "../$name" || {
		echo "❌ Compression failed."
		return 1
	}

	cd .. || {
		echo "❌ Failed to change directory."
		return 1
	}

	rm -rf "$name"
	echo "✅ Done: created '$archive' and removed '$name/'"
}

psevenz
