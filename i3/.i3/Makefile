HOSTNAME=${shell hostname}
HOST_CONF="configs/$(HOSTNAME).conf"
BASE_CONF="configs/config.base"
CONF="config.base"
I3STATUS_HOST_CONF="i3status/$(HOSTNAME).conf"
I3STATUS_CONF="$(HOME)/.i3status.conf"
I3THEME=$(HOME)/bin/i3-theme
THEME?=default

all: base_config status theme

base_config:
	cat $(BASE_CONF) > $(CONF)
	cat $(HOST_CONF) >> $(CONF)

status:
	cp $(I3STATUS_HOST_CONF) $(I3STATUS_CONF)

theme:
	$(I3THEME) $(THEME)
