# Compile lesskey file if compile is needed.
if ([[ ! -f $LESSKEY ]] || [[ $LESSKEYRC -nt $LESSKEY ]]) {
	lesskey -o $LESSKEY $LESSKEYRC
}

# Create symbolic link for prompt theme if it's not already linked.
if ! [[ -L $ZDOTDIR/autoload/prompt_powerlevel10k_setup ]] {
	ln -s /usr/share/zsh-theme-powerlevel10k/prompt_powerlevel10k_setup $ZDOTDIR/autoload/prompt_powerlevel10k_setup
}

# Recompile prompt files if it's needed.
zrecompile -p -M $ZDOTDIR/autoload/prompt_pure_setup
