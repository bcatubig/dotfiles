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

info "Setting up Debian"

# Install linuxbrew
if [[ ! -d /home/linuxbrew ]]; then
  info "Installing linuxbrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew_packages=(
  stow
  neovim
  curl
  wget
  zsh
  tmux
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
  yazi
  7zip
  jq
  resvg
  eza
)

info "Installing linuxbrew packages"
for pkg in "${brew_packages[@]}"; do
  if ! brew list | grep "${pkg}" &>/dev/null; then
    brew install "${pkg}"
    echo "[+] installed: ${pkg}"
  fi
done

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
