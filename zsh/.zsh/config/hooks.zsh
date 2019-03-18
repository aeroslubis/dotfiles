# Register hook functions.
foreach hook (
#	'preexec _preexec_ssh'
	'preexec _preexec_fasd'
) {
	eval add-zsh-hook $hook
}
unset hook

# # Transform the cursor to box form on ssh command.
# function _preexec_ssh() {
# 	if [[ "$2" =~ '^ssh[[:space:]]' ]] {
# 		printf '\e[0 q'
# 	}
# }

# Register fasd to track most used files and directories.
function _preexec_fasd() {
	if (hash fasd &>/dev/null) {
		fasd --proc $(fasd --sanitize "$1") &>/dev/null
	}
}

# Compile lesskey file if compile is needed.
if ([[ ! -f $LESSKEY ]] || [[ $LESSKEYRC -nt $LESSKEY ]]) {
	lesskey -o $LESSKEY $LESSKEYRC
}

# Create symbolic link for prompt theme if it's not already linked.
if ! [[ -L $ZDOTDIR/autoload/prompt_pure_setup ]] {
	ln -s $ZDOTDIR/themes/purer/pure.zsh $ZDOTDIR/autoload/prompt_pure_setup
}
if ! [[ -L $ZDOTDIR/autoload/async ]] {
	ln -s $ZDOTDIR/themes/purer/async.zsh $ZDOTDIR/autoload/async
}

# Recompile prompt files if it's needed.
zrecompile -p \
	-M $ZDOTDIR/autoload/async -- \
	-M $ZDOTDIR/autoload/prompt_pure_setup
