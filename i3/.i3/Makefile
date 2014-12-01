HOSTNAME=${shell hostname}
THEME?=default

install:
	cp i3status/$(HOSTNAME).conf $(HOME)/.i3status.conf
	$(PWD)/j4-make-config -r -a configs/$(HOSTNAME).conf $(THEME)

list-themes:
	$(PWD)/j4-make-config -h
