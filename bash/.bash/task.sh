alias t="task"
alias todo="clear ; task long project.none:"
alias projects="task projects"
alias waitingfor="task ls tag.has:waitingfor"
alias today="task due:today list"
alias tomorrow="task due:tomorrow list"
alias overdue="task overdue"

function postpone() {
  local id=$1
  task $id modify due:tomorrow
}
