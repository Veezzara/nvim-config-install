#!/bin/bash

# Configuration
REPO_URL=""https://github.com/Veezzara/nvim-config
CONFIG_PATH="$HOME/.config/nvim"
BACKUP_PATH="$HOME/.config/nvim_backup"

# 1. Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "Neovim is not installed. Please install Neovim and try again."
    exit 1
fi

# 2. Backup existing Neovim configuration if it exists
if [ -d "$CONFIG_PATH" ]; then
    echo "Existing Neovim configuration found. Moving it to $BACKUP_PATH."
    mv "$CONFIG_PATH" "$BACKUP_PATH"
fi

# 3. Clone the Neovim configuration repository
echo "Cloning Neovim configuration repository..."
git clone "$REPO_URL" "$CONFIG_PATH"

# 4. Install plugins
echo "Installing Neovim plugins..."
nvim --headless "+Lazy! sync" +qa

echo "Setup complete! Neovim configuration installed, and plugins are set up."

