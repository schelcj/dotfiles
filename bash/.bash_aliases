# This file is for aliases that will be used from dmenu.
#
alias set_primary_display="xrandr --output DVI-0 --primary"

alias wifi_off="nmcli r wifi off"
alias wifi_on="nmcli r wifi on"
alias vpn_off="nmcli c down id 'Biostat'"
alias vpn_on="nmcli c up id 'Biostat'"

alias wireframe="env LIBOVERLAY_SCROLLBAR=0 UBUNTU_MENUPROXY=0 /opt/WireframeSketcher/WireframeSketcher"
#alias firefox="~/Dropbox/Downloads/firefox/firefox"
alias rstudio="/usr/lib/rstudio/bin/rstudio"
#alias staruml="/opt/staruml/staruml"

alias drive-pobox="xdg-open https://drive.google.com/?authuser=0"
alias calendar-pobox="xdg-open https://www.google.com/calendar?authuser=0"
alias gmail-pobox="xdg-open http://mail.google.com/?authuser=0"

alias drive-umich="xdg-open https://drive.google.com/?authuser=1"
alias calendar-umich="xdg-open https://www.google.com/calendar?authuser=1"
alias gmail-umich="xdg-open http://mail.google.com/?authuser=1"

alias drive-merit="xdg-open https://drive.google.com/?authuser=2"
alias calendar-merit="xdg-open https://www.google.com/calendar?authuser=2"
alias gmail-merit="xdg-open http://mail.google.com/?authuser=2"

alias trello="xdg-open https://trello.com/"

alias ham="hamster-cli list | xmessage -file -"

alias milk="rememberthemilk --enable-transparenvisuals --force-enable-global-smart-add"

alias control-panel="unset XDG_CURRENT_DESKTOP ; unity-control-center"

alias sqlitestudio="/home/schelcj/Downloads/SQLiteStudio/sqlitestudio"

alias ccm=~/src/tools/ccm.pl
