#!/bin/bash

# 1. Check if a directory argument was provided
if [ -z "$1" ]; then
	echo "Error: No directory provided."
	echo "Usage: ./pack_wheel.sh <directory_name>"
	exit 1
fi

TARGET_DIR="$1"
DEST_DIR="$HOME/tmp/whl"

# 2. Verify the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
	echo "Error: Directory '$TARGET_DIR' does not exist."
	exit 1
fi

# 3. Verify the destination directory exists
if [ ! -d "$DEST_DIR" ]; then
	echo "Error: Destination directory '$DEST_DIR' does not exist."
	exit 1
fi

echo "Packing '$TARGET_DIR'..."

# 4. Run wheel pack
# We use '-d' to specify the destination directly.
# This avoids the issue of creating the file in the source folder
# and having to move it manually (or dealing with the recursive file bug).
wheel pack "$TARGET_DIR" -d "$DEST_DIR"

# 5. Check if the command was successful
if [ $? -eq 0 ]; then
	echo "--------------------------------------------------"
	echo "Success! The .whl file has been stored in: $DEST_DIR"
	# Optional: List the files in the destination to confirm
	ls -lh "$DEST_DIR"/*.whl | tail -n 1
else
	echo "Error: Failed to pack the wheel."
fi
