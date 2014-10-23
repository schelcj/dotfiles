if [ -z $TMUX_PANE ]; then
  export TERM="xterm-256color"
fi

export NNTPSERVER="localhost"
export EDITOR=$(which vim)
export PDSH_RCMD_TYPE="ssh"
export PATH=${PATH}/scripts:${PATH}/bin:${PATH}
