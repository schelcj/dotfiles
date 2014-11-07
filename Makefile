install: mod-init mod-update

mod-init:
	@git submodule init

mod-update:
	@git submodule update

mod-new:
	@echo "git submodule add <url> <path>"

mod-del:
	@echo "git submodule deinit --force <path>"

stow-trill:
	stow vim
	stow bash
	stow git
	stow i3
	stow mc
	stow perl
	stow ssh
	stow tmux
	stow x11
	stow dunst
	stow wallpapers
