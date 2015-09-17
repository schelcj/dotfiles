alias set_primary_display="xrandr --output DP-2 --primary"
alias wifi_off="nmcli r wifi off"
alias wifi_on="nmcli r wifi on"
alias vpn_off="nmcli c down id 'Biostat'"
alias vpn_on="nmcli c up id 'Biostat'"
alias win7="virt-viewer win7"
alias wireframe="env LIBOVERLAY_SCROLLBAR=0 UBUNTU_MENUPROXY=0 /opt/WireframeSketcher/WireframeSketcher"
alias firefox="~/Dropbox/Downloads/firefox/firefox"
alias rstudio="/usr/lib/rstudio/bin/rstudio"
alias staruml="/opt/staruml/staruml"

alias drive-umich="xdg-open https://drive.google.com/?authuser=1"
alias calendar-umich="xdg-open https://www.google.com/calendar?authuser=1"
alias gmail-umich="xdg-open http://mail.google.com/?authuser=1"

alias drive-pobox="xdg-open https://drive.google.com/?authuser=0"
alias calendar-pobox="xdg-open https://www.google.com/calendar?authuser=0"
alias gmail-pobox="xdg-open http://mail.google.com/?authuser=0"

alias evn="xdg-open https://www.evernote.com/Home.action"
alias trello="xdg-open https://trello.com/"

alias undrain="for i in $(sstate|grep DRAIN|awk {'print $1'}); do scontrol update nodename=$i state=resume; done"
