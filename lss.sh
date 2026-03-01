#!/bin/sh
ls -la | awk '{printf "%-20s %-10s\n", $5, $9}'
