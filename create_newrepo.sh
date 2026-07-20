#!/data/data/com.termux/files/usr/bin/env bash
echo "# pdf" >>README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/isaac4ever/pdf.git
git push -u origin main
