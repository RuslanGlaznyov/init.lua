##!/bin/bash

# Variables
NVIM_VERSION="v0.9.5"
NVIM_URL="https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux64.tar.gz"
CONFIG_REPO="https://github.com/RuslanGlaznyov/init.lua.git" # Replace this with your actual Neovim config Git repository URL

sudo apt-get install build-essential
# install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
# Function to check if a command exists
command_exists() {
  command -v "$@" >/dev/null 2>&1
}

# Install Neovim
echo "Installing Neovim $NVIM_VERSION..."

# Check if curl is installed
if ! command_exists curl; then
  echo "curl is not installed. Please install curl first."
  exit 1
fi

# Download Neovim
curl -LO $NVIM_URL

sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Create a symbolic link to nvim binary
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc
source ~/.bashrc
# Set up Neovim configuration
echo "Setting up Neovim configuration..."
mkdir -p ~/.config/nvim

# Assuming your config is in a Git repo; clone it
if [ -d "~/.config/nvim" ]; then
  rm -rf ~/.config/nvim
fi

git clone $CONFIG_REPO ~/.config/nvim


cp ~/.config/nvim/.tmux.conf $HOME
# Install TPM and tmux plugins
echo "Installing TPM and tmux plugins..."
TPM_DIR="$HOME/.tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm $TPM_DIR

# Source the tmux configuration to load TPM and then install the plugins
tmux source-file ~/.tmux.conf
$TPM_DIR/bin/install_plugins
echo "clear install files"
rm -rf nvim-linux64.tar.gz  ripgrep_13.0.0_amd64.deb
echo "Installation and configuration complete!"
