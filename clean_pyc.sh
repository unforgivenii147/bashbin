#!/data/data/com.termux/files/usr/bin/bash

# Target the Termux prefix (usually /data/data/com.termux/files/usr)
TARGET_DIR="${PREFIX:-/data/data/com.termux/files/usr}"

echo "🧹 Sweeping for Python cache files in $TARGET_DIR..."

# Find and remove __pycache__ directories
find "$TARGET_DIR" -name "__pycache__" -type d -exec rm -rf {} +

# Find and remove any stray compiled files not in a cache dir
find "$TARGET_DIR" -name "*.pyc" -delete
find "$TARGET_DIR" -name "*.pyo" -delete

echo "✨ Termux is now clean!"