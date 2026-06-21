#!/data/data/com.termux/files/usr/bin/python
nvim --headless -c "lua require('mason').setup()" -c "lua vim.wait(500, function() return pcall(vim.cmd, 'MasonUninstall black') end)" -c qall
