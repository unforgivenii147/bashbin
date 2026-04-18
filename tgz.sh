#!/bin/sh
folder="$(basename "$PWD")"
tar -cf - . | gzip >"../${folder}.tar.gz"
rm -rf ./*
