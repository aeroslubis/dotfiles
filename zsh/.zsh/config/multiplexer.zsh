# Automatically open tmux if there is no tmux session
if ! tmux has-session -t "$TMUX_SESSION_NAME" 2> /dev/null; then
	if [[ $(stty size | cut -d' ' -f1) > 38 ]]; then
		tmux new-session -s "$TMUX_SESSION_NAME" -n '  main'
	fi
fi
