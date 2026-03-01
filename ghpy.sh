#!/data/data/com.termux/files/usr/bin/bash
echo "50 most active py repos"
gh search repos "language:Python" \
	--sort updated \
	--order desc \
	--limit 50

# -------- other useful stuff --------




