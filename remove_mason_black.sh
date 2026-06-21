#!/data/data/com.termux/files/usr/bin/python
nvim --headless -c "lua require('mason').setup()" -c "MasonUninstall black" -c qall
