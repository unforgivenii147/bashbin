#!/data/data/com.termux/files/usr/bin/python
# Generate SSH key if you don't have one
ssh-keygen -t ed25519 -C "your_email@example.com"

# Add to GitHub (manual step)
cat ~/.ssh/id_ed25519.pub
# Then go to GitHub Settings > SSH and GPG keys > New SSH Key

# Clone with SSH
gh repo clone git@github.com:dpetka2001/dotfiles.git
