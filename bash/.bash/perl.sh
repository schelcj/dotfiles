eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

if [ -d ${HOME}/perl5/perlbrew ]; then
  source ${HOME}/perl5/perlbrew/etc/bashrc
fi

export PERLCRITIC="${HOME}/.perlcriticrc"
export PERLTIDY="${HOME}/.perltidyrc"
export PATH=${HOME}/perl5/bin:${PATH}

alias local_lib_here="eval $(perl -Mlocal::lib=./)"
# alias perldoc="perlfind"
# alias ack="ack-grep"
