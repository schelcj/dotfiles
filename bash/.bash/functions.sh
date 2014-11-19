function test_ppt_tmp() {
  local template="$1"
  erb -x -T '-' -P $template | ruby -c
}

function list_projs() {
  for proj in $(t lsprj); do
    echo "Project: $(echo ${proj#+}|tr [[:lower:]] [[:upper:]])"
    t ls $proj;
    echo ""
  done
}

function mirror_url() {
  local ext=$1
  local url=$2
  wget --recursive --no-parent --accept "*.${ext}"  --directory-prefix=${HOME}/tmp/ \
    --no-check-certificate --cut-dirs=1 $url
}

function mirror_lexal() {
  wget --recursive --no-parent --accept "*.mp3,*.flac" --directory-prefix=${HOME}/tmp/ \
    --no-check-certificate --cut-dirs=1 https://home.lexal.net:1280/adelphi/
}

function get_mixtape() {
  local number=$1
  local host="cerebrum.dnalounge.com"
  local port="8001"
  local path="/mixtape/${number}.mp3"
  local dir="${HOME}/mp3"

  streamripper http://${host}:${port}/${path} -d $dir
}

function autoCompleteHostname() {
  local hosts=($(awk '{print $1}' ~/.ssh/known_hosts | cut -d, -f1));
  local cur=${COMP_WORDS[COMP_CWORD]};
  COMPREPLY=($(compgen -W '${hosts[@]}' -- $cur ))
}

function _play() {
  local mplayer_opt="$1"
  local media="$2"
  local mplayer_cmd='mplayer -prefer-ipv4 -quiet -vo none -ao sdl -input file=/tmp/mplayer'
  local dialog_height=25
  local dialog_width=60
  local dialog_cmd="dialog --progressbox $dialog_height $dialog_width"

  case "$mplayer_opt" in
    'shuffle')
      cmd="$mplayer_cmd -shuffle -playlist"
      ;;
    'repeat')
      cmd="$mplayer_cmd -loop 0 -playlist"
      ;;
    'single')
      cmd=$mplayer_cmd
      ;;
    'once')
      cmd="$mplayer_cmd -playlist"
      ;;
  esac

  $cmd "$media" 2>&1 | $dialog_cmd
}

function play() {
  _play "once" $1
}

function play_repeat() {
  _play "repeat" $1
}

function play_shuffle() {
  _play "shuffle" $1
}

function play_single() {
  _play "single" $1
}

function html2pdf() {
  local file=$1
  filename=$(echo $file|cut -d\. -f1)
  html2ps $file | ps2pdf - ${filename}.pdf
}

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

function overview() {
  local now=$(date '+%Y-%m-%d')
  local start="${now}T00:00:00"
  local end="${now}T23:59:59"

  gcalcli agenda $start $end
  rtm ls list:today
}
