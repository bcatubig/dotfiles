function tnew() {
  local session_name="$1"

  if [[ -z "${session_name}" ]]; then
    echo "ERROR: missing session_name"
    return
  fi

  tmux new-session -d -s "${session_name}" "nvim" >/dev/null
  tmux rename-window -t "${session_name}":1 "vim"
  tmux new-window -t "${session_name}"
  tmux rename-window -t "${session_name}":2 "terminal"
  tmux select-window -t "${session_name}":1
  tmux a -t "${session_name}"
}
