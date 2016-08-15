HOSTNAME=${shell hostname}
THEME?=gruvbox

install:
	@cp i3status/$(HOSTNAME).conf $(HOME)/.i3status.conf
	@$(PWD)/j4-make-config -r -a configs/$(HOSTNAME).conf $(THEME) 1>/dev/null

list-themes:
	@$(PWD)/j4-make-config -h
