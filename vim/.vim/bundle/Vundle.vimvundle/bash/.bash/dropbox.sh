export DROPBOX="${HOME}/Dropbox"
export DROPBOX_PUBLIC="${DROPBOX}/Public"

function pubfile() {
  local file="$1"
  cp $file $DROPBOX_PUBLIC
  dropbox.py puburl "${DROPBOX_PUBLIC}/${file}"
}
