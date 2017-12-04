if [ -z $TMUX_PANE ]; then
  export TERM="xterm-256color"
fi

export NNTPSERVER="localhost"
export EDITOR=$(which vim)
export PDSH_RCMD_TYPE="ssh"
export PATH=${HOME}/scripts:${HOME}/bin:${PATH}

hash ack-grep 2>/dev/null
if [ $? -eq 0 ]; then
  alias ack=$(which ack-grep)
fi
