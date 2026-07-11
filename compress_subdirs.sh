#!/data/data/com.termux/files/usr/bin/env bash

# compress_dirs.sh - Compress each subdirectory with tar + pixz, then remove originals

set -euo pipefail

# Check if pixz is installed
if ! command -v pixz &> /dev/null; then
    echo "Error: pixz is not installed. Install it first:"
    echo "  Ubuntu/Debian: sudo apt install pixz"
    echo "  macOS: brew install pixz"
    echo "  Or use: xz -T0 instead (modify script)"
    exit 1
fi

# Find all subdirectories (non-recursive, excluding hidden dirs)
find . -maxdepth 1 -mindepth 1 -type d ! -name ".*" | while read -r dir; do
    # Remove leading ./
    dir_name="${dir#./}"
    
    echo "Processing: $dir_name"
    
    # Archive name
    archive="${dir_name}.tar.xz"
    
    # Compress with tar + pixz
    echo "  Creating: $archive"
    if tar -cf - -C "$dir_name" . | pixz -9 > "$archive"; then
        # Verify archive is valid before removing
        if tar -tf "$archive" &> /dev/null; then
            echo "  ✅ Successfully compressed: $archive"
            
            # Remove original directory
            echo "  Removing: $dir_name/"
            rm -rf "$dir_name"
        else
            echo "  ❌ Archive verification failed: $archive"
            rm -f "$archive"
            exit 1
        fi
    else
        echo "  ❌ Compression failed for: $dir_name"
        rm -f "$archive"
        exit 1
    fi
done

echo "✅ All subdirectories compressed successfully!"
