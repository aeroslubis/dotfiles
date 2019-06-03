# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
# source "$ZDOTDIR/plugins/zsh-autopair/autopair.zsh"


# zsh slimline prompt
# # Right prompt
# export SLIMLINE_LEFT_PROMPT_SECTIONS="vi_mode user_host_info cwd"
# export SLIMLINE_RIGHT_PROMPT_SECTIONS="execution_time exit_status git virtualenv"
# # export SLIMLINE_ALWAYS_SHOW_USER_HOST_INFO="1"
# # Promt symbol format
# export SLIMLINE_SYMBOL_READY_FORMAT="%F{blue}❯%f"
# export SLIMLINE_SYMBOL_WORKING_FORMAT="%F{red}❯%f"
# # Git Indicator
# export GITLINE_REPO_INDICATOR='${reset}'
# export GITLINE_BRANCH='[${blue}${branch}${reset}]'
# # VI Mode
# export SLIMLINE_VI_MODE_NORMAL_FORMAT="%F{yellow}❮❮%f"
# export SLIMLINE_VI_MODE_INSERT_FORMAT="%F{blue}❯❯%f"
# export SLIMLINE_VI_MODE_REPLACE_FORMAT="%F{red}❮❮%f"

# source "$ZDOTDIR/plugins/slimline/slimline.zsh"

source "$ZDOTDIR/plugins/smartdots.zsh"

# zsh-auto-suggest
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
	typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
	typeset -g ZSH_AUTOSUGGEST_ORIGINAL_WIDGET_PREFIX='autosuggest-orig-'
	typeset -g ZSH_AUTOSUGGEST_STRATEGY='default'
	typeset -g ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=''
	typeset -g ZSH_AUTOSUGGEST_ASYNC_PTY_NAME='zsh_autosuggest_pty'
	typeset -ga ZSH_AUTOSUGGEST_EXECUTE_WIDGETS=()
	typeset -ga ZSH_AUTOSUGGEST_CLEAR_WIDGETS=(
		history-search-forward
		history-search-backward
		history-beginning-search-forward
		history-beginning-search-backward
		history-substring-search-up
		history-substring-search-down
		up-line-or-beginning-search
		down-line-or-beginning-search
		up-line-or-history
		down-line-or-history
		accept-line
	)
	typeset -ga ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
		vi-forward-char
	)
	typeset -ga ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
		vi-forward-word
	)
	typeset -ga ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
		orig-\*
		beep
		run-help
		set-local-history
		which-command
		yank
		yank-pop
	)

source "$ZDOTDIR/plugins/base16-shell/base16-shell.plugin.zsh"
source "$ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
