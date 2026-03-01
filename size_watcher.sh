#!/bin/bash

# --- CONFIGURATION ---
TARGET_DIR="/data/data/com.termux/files/usr/lib/python3.12/site-packages"
THRESHOLD_MB=500  # Set your limit in Megabytes
# ---------------------

# Calculate size in MB
# 'du' gets disk usage, 'cut' grabs the number
CURRENT_SIZE=$(du -sm "$TARGET_DIR" | cut -f1)

if [ "$CURRENT_SIZE" -gt "$THRESHOLD_MB" ]; then
    MESSAGE="⚠️ Alert: $TARGET_DIR has reached ${CURRENT_SIZE}MB (Limit: ${THRESHOLD_MB}MB)"
    
    # Check if termux-api is available for a real notification
    if command -v termux-notification > /dev/null; then
        termux-notification --title "Storage Alert" --content "$MESSAGE" --priority high
    else
        # Fallback to standard terminal output
        echo -e "\033[0;31m$MESSAGE\033[0m"
    fi
else
    echo "Check passed: $TARGET_DIR is at ${CURRENT_SIZE}MB."
fi