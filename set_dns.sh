#!/data/data/com.termux/files/usr/bin/bash
# Check if it's a symlink
#ls -l /data/data/com.termux/files/usr/etc/resolv.conf

# Create a custom file
#echo "nameserver 8.26.26.26" > ~/.resolv.conf
#echo "nameserver 9.9.9.9" >> ~/.resolv.conf
#echo "nameserver 8.8.8.8" >> ~/.resolv.conf

# Point to it (may need root)
#export RESOLV_CONF=~/.resolv.conf


# Set DNS via environment variable
export ANDROID_DNS_OVERRIDE="1.1.1.1,8.8.8.8"

# Or use termux's built-in method
#termux-fix-shebang


nslookup github.com 1.1.1.1
nslookup github.com 8.8.8.8
ping -c 3 1.1.1.1
