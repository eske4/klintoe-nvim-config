#!/bin/bash

# Ensure yay is installed
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Please install yay and rerun the script."
    exit 1
fi

# Create directory for code snippets if it doesn't exist
mkdir -p ~/codesnips

# Install Lua, LuaCheck, Rust Analyzer, Luarocks, and Mercurial
yay -S --noconfirm lua luacheck rust-analyzer luarocks mercurial

# Install Lua packages
luarocks install argparse
luarocks install luafilesystem
luarocks install jsregexp

# Install additional packages
yay -S --noconfirm ripgrep gzip unzip curl tar shellcheck tree-sitter-cli gcc clang dotnet-sdk flutter nodejs cmake r php ruby python-pynvim silicon tmux php neovim

# Install tmux plugin manager
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo "All packages have been successfully installed."
