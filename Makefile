install: mod-init mod-update

mod-init:
	@git submodule init

mod-update:
	@git submodule update

mod-new:
	@echo "git submodule add <url> <path>"

mod-del:
	@echo "git submodule deinit --force <path>"

stow-default:
	stow vim
	stow bash
	stow git
	stow perl
	stow ssh
	stow tmux

stow-trill: stow-default
	stow i3
	stow mc
	stow x11
	stow dunst
	stow wallpapers
	stow doing
	stow urxvt

stow-freedman: stow-default
	stow i3
	stow mc
	stow x11
	stow dunst
	stow wallpapers
	stow urxvt

stow-csg: stow-default

stow-katan: stow-default
	stow mc

stow-potter: stow-default stow-freedman
