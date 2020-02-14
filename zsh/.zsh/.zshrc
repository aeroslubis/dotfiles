# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
