#!/data/data/com.termux/files/usr/bin/bash

ruff --config "format.quote-style = 'double'" format "${@:-.}"
