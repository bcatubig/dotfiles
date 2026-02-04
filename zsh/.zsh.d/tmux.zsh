function tnew() {

  SESSION_NAME=$1

  # Check if the session already exists
  tmux has-session -t "$SESSION_NAME" 2>/dev/null
  if [ $? != 0 ]; then
    tmux new-session -d -s "$SESSION_NAME" -n neovim 'nvim'
    tmux new-window -t "$SESSION_NAME:" -n terminal
  fi

  # Select neovim window
  tmux select-window -t "$SESSION_NAME:1"

  tmux attach -t "$SESSION_NAME"
}
