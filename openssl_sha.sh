#!/bin/sh
openssl dgst -hex -r -sha256 "$@"
