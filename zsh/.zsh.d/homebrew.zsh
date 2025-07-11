if [[ "$(uname -o)" == "Darwin" ]] && [[ -d /opt/homebrew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    if [[ -d "$(brew --prefix)/share/google-cloud-sdk" ]]; then
      source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
      source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
    fi
fi
