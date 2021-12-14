foreach piece (
    prompt.zsh
    load.zsh
    exports.zsh
    settings.zsh
    functions.zsh
    aliases.zsh
    widgets.zsh
    mappings.zsh
    plugins.zsh
) {
    source $ZDOTDIR/configs/$piece
}

# To customize prompt, run `p10k configure` or edit ~/.zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
