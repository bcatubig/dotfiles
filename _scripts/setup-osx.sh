#!/usr/bin/env bash

set -euo pipefail

info() {
  local msg=$1
  echo "$(date +"%Y-%m-%d %H:%M:%S") [$(basename "$0")] INFO: $msg"
}

error() {
  local msg=$1
  echo "$(date +"%Y-%m-%d %H:%M:%S") [$(basename "$0")] ERROR: $msg"
}

info "Setting up OSX"

# Install Homebrew
if [[ ! -d /opt/homebrew ]]; then
  info "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew_packages=(
  stow
  make
  neovim
  curl
  wget
  zsh
  tmux
  wezterm@nightly
  lazygit
  pyenv
  pyenv-virtualenv
  go
  node
  zoxide
  fzf
  ripgrep
  fd
  rust
  htop
  sshpass
  ssh-copy-id
)

info "Installing homebrew packages"
for pkg in "${brew_packages[@]}"; do
  if ! brew list | grep "${pkg}" &>/dev/null; then
    brew install "${pkg}"
    echo "[+] installed: ${pkg}"
  fi
done

# Install JetBrainsMono
if ! brew list | grep font-jetbrains-mono-nerd-font &>/dev/null; then
  brew install --cask font-jetbrains-mono-nerd-font
  echo "[+] installed: JetBrains Mono Nerd Font"
fi

# Install iterm2
if ! brew list | grep iterm2 &>/dev/null; then
  brew install --cask iterm2
  echo "[+] installed: iterm2"
fi

# Install obsidian
if ! brew list | grep obsidian &>/dev/null; then
  brew install --cask obsidian
  echo "[+] installed obsidian"
fi

info "Installing configurations"

# Setup ZSH
stow zsh
echo "[+] installed zsh configs"

# Setup Neovim
stow nvim
echo "[+] installed neovim configs"

# Setup Wezterm
stow wezterm
echo "[+] installed wezterm configs"

# Setup tmux
stow tmux
echo "[+] installed tmux configs"

info "Reloading ZSH"
exec zsh -l
