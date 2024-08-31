#!/bin/bash

# Remove Devbox
sudo rm -rf \
    /usr/local/bin/devbox \
    ~/.cache/devbox \
    ~/.local/share/devbox \
    ~/.zshrc \
    ~/.config/starship.toml \
    ~/.config/fabric

# Remove Fira Code Nerd Font
rm -rf ~/.local/share/fonts/FiraCode*
fc-cache -fv

# Remove Fira Code font
sudo apt remove fonts-firacode -y

# Remove KCL and KCL Language Server
wget -q https://kcl-lang.io/script/uninstall-cli.sh -O - | /bin/bash
wget -q https://kcl-lang.io/script/uninstall-kcl-lsp.sh -O - | /bin/bash

# Remove Zinit
rm -rf ~/.zinit

# Note: starship, thefuck, eza, fzf, zoxide, and bat are not installed in the install script,
# so they are not included in the uninstall script. If you've installed them separately, 
# you may want to remove them using the appropriate methods.

echo "Uninstallation complete. You may need to restart your terminal for all changes to take effect."