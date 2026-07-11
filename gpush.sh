#!/data/data/com.termux/files/usr/bin/env bash
#\!/bin/sh
git add *
echo 'Enter the commit message:'
read commitMessage
git commit -m "$commitMessage"
git push
