#!/usr/bin/env bash
set -e

echo "🚀 Setting up Neovim environment..."

# Ensure dependencies
sudo apt update && sudo apt install -y neovim git curl unzip build-essential

# Clone your config if not already present
if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/YOURNAME/nvim-config.git ~/.config/nvim
else
  echo "✅ Config already present"
fi

# Install Lazy.nvim (plugin manager)
if [ ! -d "$HOME/.local/share/nvim/lazy/lazy.nvim" ]; then
  echo "📦 Installing Lazy.nvim..."
  git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
fi

echo "🎨 Installing plugins..."
nvim --headless "+Lazy! sync" +qa

echo "✅ Done! Launch Neovim and bask in your own genius."
