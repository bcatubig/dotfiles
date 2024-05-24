.PHONY: setup
setup: zsh nvim tmux wezterm

.PHONY: zsh
zsh:
	stow zsh

.PHONY: nvim
nvim:
	stow nvim

.PHONY: tmux
tmux:
	stow tmux

.PHONY: wezterm
wezterm:
	stow wezterm

.PHONY: clean
clean:
