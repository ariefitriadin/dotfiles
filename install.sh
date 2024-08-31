#!/bin/bash

# Install Fira Code Nerd Font
sudo apt update
sudo apt install -y wget unzip
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
unzip FiraCode.zip
fc-cache -fv

# Install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# Install Fira Code font
sudo apt install -y fonts-firacode

# Install KCL Language Server
wget -q https://kcl-lang.io/script/install-kcl-lsp.sh -O - | /bin/bash

# Install KCL
wget -q https://kcl-lang.io/script/install-cli.sh -O - | /bin/bash

# Install Devbox
curl -fsSL https://get.jetify.com/devbox | bash

echo "Installation complete. Please restart your terminal or reload your font cache for changes to take effect."
