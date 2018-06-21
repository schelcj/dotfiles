eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)

if [ -d ${HOME}/perl5/perlbrew ]; then
  source ${HOME}/perl5/perlbrew/etc/bashrc
fi

if [ -d ${HOME}/opt/local/pinto ]; then
  source ${HOME}/opt/local/pinto/etc/bashrc
fi

# export PERLCRITIC="${HOME}/.perlcriticrc"
# export PERLTIDY="${HOME}/.perltidyrc"
# export PATH=${HOME}/perl5/bin:${PATH}

# alias local_lib_here="eval $(perl -Mlocal::lib=./)"
# alias perldoc="perlfind"
# alias ack="ack-grep"

function pack_file() {
  local file=$1
  local oldpwd=$(pwd)
  local tmpdir=$(mktemp -d)
  local trace="${tmpdir}/fatpacker.trace"
  local packlist="${tmpdir}/packlists"

  echo "Temporary results are in $tmpdir"

  fatpack trace --to=$trace $file
  fatpack packlists-for $(cat $trace) > $packlist
  fatpack tree $(cat $packlist)
  (fatpack file ; cat $file) > ${oldpwd}/${file}.packed.pl
}


