#!/bin/bash

# Ensure yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Please install yay and rerun the script."
    exit 1
fi

# Create directory for code snippets if it doesn't exist
mkdir -p "$HOME/Pictures/Codesnips"

# Install Lua, LuaCheck, Rust Analyzer, Luarocks, and Mercurial
yay -S --noconfirm lua luacheck rust-analyzer luarocks mercurial

# Install Lua packages
sudo luarocks install argparse
sudo luarocks install luafilesystem
sudo luarocks install jsregexp

# Install additional packages
yay -S --noconfirm ripgrep gzip unzip curl tar shellcheck tree-sitter-cli gcc clang dotnet-sdk nodejs cmake r php ruby python-pynvim silicon tmux php neovim ghcup-hs-bin fzf
ghcup install hls
#install flutter manually

# Install tmux plugin manager
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source "$HOME/.tmux.conf"
cp "$HOME/.config/nvim/developer_assets/.tmux/plugins/tmux-which-key/config.yaml" "$HOME/.tmux/plugins/tmux-which-key/"
echo "Copied config.yaml to tmux which key"


echo "All packages have been successfully installed."
