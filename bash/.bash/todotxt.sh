export TODOTXT_PRESERVE_LINE_NUMBERS=0
export TODOTXT_AUTO_ARCHIVE=1
export TODOTXT_DATE_ON_ADD=1
export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'

alias t="~/bin/todo.sh"

alias recur="~/bin/todo.sh -T addto recur.txt"
alias todo="clear ; t ls -@home -+maint"
alias waitingfor="clear ; t ls +waitingfor"
alias projects="clear ; t lsprj"

source ${DOT_FILES}/bash/todo_completion
