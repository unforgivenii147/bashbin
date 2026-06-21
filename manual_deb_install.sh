#!/data/data/com.termux/files/usr/bin/python
# 1. Find the package URL
pkg show tur-packages/python-cryptography

# 2. Or download directly from TUR repository
wget https://packages.termux.org/apt/termux-main/pool/main/p/python-cryptography/python-cryptography_38.0.1_arm.deb

# 3. Install the .deb file
dpkg -i python-cryptography_38.0.1_arm.deb

# If dependencies fail, fix them
pkg install -f
