# zsh-autopair: Insert or delete brackets, parens, quotes in pair.
# source "$ZDOTDIR/plugins/zsh-autopair/autopair.zsh"

# source "$ZDOTDIR/themes/ultimate/ultimate.zsh-theme"
# source "$ZDOTDIR/themes/common/common.zsh-theme"
# source "$ZDOTDIR/plugins/zsh-interactive-cd.plugin.zsh"
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

# zsh-syntax-highlighting: Syntax highlighting support.
# source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
# 	typeset -ga ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
# 	typeset -gA ZSH_HIGHLIGHT_STYLES
# 
# 	# brackets
# 	ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]='bg=black'
# 	ZSH_HIGHLIGHT_STYLES[default]=none
# 	ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
# 	ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green
# 	ZSH_HIGHLIGHT_STYLES[alias]=none
# 	ZSH_HIGHLIGHT_STYLES[builtin]=none
# 	ZSH_HIGHLIGHT_STYLES[function]=none
# 	ZSH_HIGHLIGHT_STYLES[command]=none
# 	ZSH_HIGHLIGHT_STYLES[precommand]=none
# 	ZSH_HIGHLIGHT_STYLES[commandseparator]=none
# 	ZSH_HIGHLIGHT_STYLES[hashed-command]=none
# 	ZSH_HIGHLIGHT_STYLES[path]=none
# 	ZSH_HIGHLIGHT_STYLES[globbing]=none
# 	ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
# 	ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
# 	ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
# 	ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
# 	ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
# 	ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
# 	ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
# 	ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
# 	ZSH_HIGHLIGHT_STYLES[assign]=none
# 
# 	ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=red,bg=black') 
