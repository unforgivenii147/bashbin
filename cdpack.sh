#!/bin/sh
for f in *; do bash -c "cd $f && wheel pack ."; done
