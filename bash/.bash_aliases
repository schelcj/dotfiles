alias set_primary_display="xrandr --output DVI-0 --primary"
alias wifi_off="nmcli r wifi off"
alias wifi_on="nmcli r wifi on"
alias vpn_off="nmcli c down id 'Biostat'"
alias vpn_on="nmcli c up id 'Biostat'"
alias win7="virt-viewer win7"
alias wireframe="env LIBOVERLAY_SCROLLBAR=0 UBUNTU_MENUPROXY=0 /opt/WireframeSketcher/WireframeSketcher"
#alias firefox="~/Dropbox/Downloads/firefox/firefox"
alias rstudio="/usr/lib/rstudio/bin/rstudio"
alias staruml="/opt/staruml/staruml"

alias drive-pobox="xdg-open https://drive.google.com/?authuser=0"
alias calendar-pobox="xdg-open https://www.google.com/calendar?authuser=0"
alias gmail-pobox="xdg-open http://mail.google.com/?authuser=0"

alias drive-umich="xdg-open https://drive.google.com/?authuser=1"
alias calendar-umich="xdg-open https://www.google.com/calendar?authuser=1"
alias gmail-umich="xdg-open http://mail.google.com/?authuser=1"

alias drive-merit="xdg-open https://drive.google.com/?authuser=2"
alias calendar-merit="xdg-open https://www.google.com/calendar?authuser=2"
alias gmail-merit="xdg-open http://mail.google.com/?authuser=2"

alias evn="xdg-open https://www.evernote.com/Home.action"
alias trello="xdg-open https://trello.com/"

alias ham="hamster-cli list | xmessage -file -"
alias mux="tmuxinator"

alias milk="rememberthemilk --enable-transparenvisuals --force-enable-global-smart-add"

alias rename_crai="ls -1 *.cram|cut -d\. -f1|xargs -I % mv -v %.crai %.cram.crai"

alias squeue_priority='squeue -S -p -t pd -l -o "%9Q %.15i %.9P %.8j %.8u %.8T %.10M %.9l %.6D %R" --sort=-p,i'

alias control-panel="unset XDG_CURRENT_DESKTOP ; unity-control-center"
