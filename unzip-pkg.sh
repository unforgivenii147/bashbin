#!/bin/bash

PKG_NAME="$1"
PYTHON_VERSION="python3.12"
SITE_PACKAGES="/data/data/com.termux/files/usr/lib/$PYTHON_VERSION/site-packages"
ZIP_DIR="/data/data/com.termux/files/usr/lib/$PYTHON_VERSION/site-packages"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ -z "$PKG_NAME" ]; then
	echo -e "${RED}Usage: $0 <package-name>${NC}"
	exit 1
fi

ZIP_FILE="$ZIP_DIR/${PKG_NAME}.zip"

if [ ! -f "$ZIP_FILE" ]; then
	echo -e "${RED}Error: $ZIP_FILE not found.${NC}"
	exit 1
fi

#echo -e "${YELLOW}Inspecting $PKG_NAME archive...${NC}"

# Check if the ZIP contains .py or .pyc files
HAS_PY=$(unzip -l "$ZIP_FILE" | grep -q "\.py$" && echo true || echo false)
HAS_PYC=$(unzip -l "$ZIP_FILE" | grep -q "\.pyc$" && echo true || echo false)

if [ "$HAS_PYC" = true ] && [ "$HAS_PY" = false ]; then
	echo -e "${YELLOW}⚠️  Notice: This ZIP contains ONLY bytecode (.pyc).${NC}"
	echo -e "${YELLOW}Source code (.py) will not be recovered, only the executable binary.${NC}"
fi

# 1. Remove the loader stub
rm -f "$SITE_PACKAGES/${PKG_NAME}.py"

# 2. Extract files back to site-packages
unzip -qq -o "$ZIP_FILE" -d "$SITE_PACKAGES/"

# 3. Restore .so files if a hybrid lib folder exists
LIBS_PATH="$ZIP_DIR/${PKG_NAME}_libs"
if [ -d "$LIBS_PATH" ]; then
#	echo -e "${YELLOW}Restoring C extensions...${NC}"
	cp -r "$LIBS_PATH/"* "$SITE_PACKAGES/"
	rm -rf "$LIBS_PATH"
fi

# 4. Cleanup
rm "$ZIP_FILE"

echo -e "${GREEN}✓ $PKG_NAME successfully restored to $SITE_PACKAGES${NC}"
