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

# Install Homebrew
if [[ ! -d /opt/homebrew ]]; then
  info "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  info "Homebrew already installed"
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
)

for pkg in "${brew_packages[@]}"; do
  if ! brew list | grep "${pkg}"; then
    info "Installing package: ${pkg}"
    brew install "${pkg}"
  else
    info "${pkg} already installed"
  fi
done

# Setup ZSH
info "Installing ZSH config"
stow zsh

# Setup Neovim
info "Installing Neovim configs"
stow nvim

# Setup Wezterm
info "Installing Wezterm configs"
stow wezterm

# Setup tmux
info "Installing tmux"
stow tmux

info "Reloading ZSH"
exec zsh -l
