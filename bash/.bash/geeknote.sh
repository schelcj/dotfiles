alias gn="geeknote"
alias later="geeknote edit --note 'Procrastination'"

function _get_note_count() {
  echo "$(geeknote find --notebooks "$1" --search "$2" --exact-entry | grep 'Total found:' | cut -d\  -f3)"
}

function _find_or_create() {
  local notebook="$1"
  local title="$2"
  local new_title="$3"
  local results=$(_get_note_count "$notebook" "$title")

  case "$results" in
    ''|0)
      geeknote create --notebook "$notebook" --title "$title" --content WRITE
      ;;
    1)
      if [ ! -z $new_title ]; then
        geeknote edit 1 --title $new_title
      else
        geeknote edit 1
      fi
      ;;
    *)
      echo "ACK, too many matches [$results]! Bailing out!"
      ;;
  esac
}

function _meeting_note() {
  local notebook="$1"
  local title="$2"
  local new_title="$3"

  if [ "$new_title" == "new" ]; then
    new_title="$(date '+%Y-%m-%d')"
  fi

  _find_or_create "$notebook" "$title" "$new_title"
}

function gn_new() {
  local title="$*"

  if [ -z "$title" ]; then
    title="untitled note"
  fi

  geeknote create --title "$title" --content WRITE
}

function labbook() {
  if [ "$1" == "list" ]; then
    geeknote find --count 1000 --notebooks 'Labbooks'
    return
  fi

  local title="$*"

  if [ -z "$title" ]; then
    title="untitled sysadmin labbook entry"
  fi

  geeknote create --content WRITE --title "$title" --notebook 'Labbooks' --tags "sysadmin"
}

function journal() {
  _find_or_create "Journal" "$(date '+%Y-%m-%d')"
}

function chair_mtg_notes() {
  _meeting_note "Biostat" "Next Chair Meeting" "$1"
}

function isc_mtg_notes() {
  _meeting_note "SPH ICS" "Next Staff Meeting" "$1"
}
