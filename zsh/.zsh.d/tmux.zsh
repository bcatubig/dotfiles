function tnew() {
  local session_name="$1"

  if [[ -z "${session_name}" ]]; then
    echo "ERROR: missing session_name"
    return
  fi

  if tmux list-sessions | grep "^${session_name}$"; then
    tmux attach-session -t "${session_name}"
  else
    tmux new-session -d -s "${session_name}"
    tmux rename-window -t "${session_name}":1 "nvim"
    tmux send-keys -t "${session_name}:1" 'nvim' Enter
    tmux new-window -t "${session_name}"
    tmux rename-window -t "${session_name}":2 "terminal"
    tmux select-window -t "${session_name}":1
    tmux a -t "${session_name}"
  fi
}
