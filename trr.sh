#!/bin/bash

# tar_zst.sh - Compress current directory into a tar.zst archive and remove original

set -e  # Exit on error

# Main compression function
compress_directory() {
  local name="$(basename "$PWD")"
  local archive="../${name}.tar"

  echo "🗜️ Compressing '$name' into '$archive'..."
  tar -cf "$archive" -C .. "$name" || {
    echo "❌ Compression failed."
    exit 1
  }

  cd .. || {
    echo "❌ Failed to change directory."
    exit 1
  }
  
  rm -rf "$name"
  zstd --rm "${name}.tar"

  echo "✅ Done: created '${name}.tar.zst' and removed '$name/'"
  
}

# Run the function
compress_directory
cd ..
