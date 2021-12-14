# Register functions as widgets.
foreach widget (
    # Built-in
    'add-surround surround'
    'delete-surround surround'
    'change-surround surround'
    select-quoted
    select-bracketed

    # Custom
    custom-expand-global-alias
    custom-fzf-launch-from-history
    custom-smartdots
    custom-jump-after-first-word
    custom-inplaceMkDirs
    custom-tmux-scroll-up
) {
    eval zle -N $widget
}
unset widget

# custom-expand-global-alias - Expand global alias to its full form.
function custom-expand-global-alias() {
    if [[ "$LBUFFER" =~ ' [A-Z0-9]+$' ]] {
        zle _expand_alias
    }

    zle self-insert
}

# custom-fzf-launch-from-history - Select command from history into the command line.
function custom-fzf-launch-from-history() {
    if (! hash fzf &>/dev/null) {
        return 1
    }

    setopt LOCAL_OPTIONS NO_GLOB_SUBST NO_POSIX_BUILTINS PIPE_FAIL 2>/dev/null

    local selected=(
        $(
            fc -l 1 \
                | fzf \
                    --tac \
                    --nth='2..,..' \
                    --tiebreak='index' \
                    --query="${LBUFFER}" \
                    --exact \
                    --prompt='$ '
        )
    )

    local stat=$?

    if [[ "$selected" != '' ]] {
        local num=$selected[1]

        if [[ "$num" != '' ]] {
            zle vi-fetch-history -n $num
        }
    }

    zle redisplay

    if (typeset -f zle-line-init &>/dev/null) {
        zle zle-line-init
    }

    return $stat
}

# custom-smartdots - jump up directory easily
function custom-smartdots() {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}

# custom-jump-after-first-word - jump behind the first word on the cmdline.
function custom-jump-after-first-word () {
    local words
    words=(${(z)BUFFER})

    if (( ${#words} <= 1 )) ; then
        CURSOR=${#BUFFER}
    else
        CURSOR=${#${words[1]}}
    fi
}

# custom-inplaceMkDirs - Create directory under cursor or the selected area
function custom-inplaceMkDirs () {
    local PATHTOMKDIR
    if ((REGION_ACTIVE==1)); then
        local F=$MARK T=$CURSOR
        if [[ $F -gt $T ]]; then
            F=${CURSOR}
            T=${MARK}
        fi
        # get marked area from buffer and eliminate whitespace
        PATHTOMKDIR=${BUFFER[F+1,T]%%[[:space:]]##}
        PATHTOMKDIR=${PATHTOMKDIR##[[:space:]]##}
    else
        local bufwords iword
        bufwords=(${(z)LBUFFER})
        iword=${#bufwords}
        bufwords=(${(z)BUFFER})
        PATHTOMKDIR="${(Q)bufwords[iword]}"
    fi
    [[ -z "${PATHTOMKDIR}" ]] && return 1
    PATHTOMKDIR=${~PATHTOMKDIR}
    if [[ -e "${PATHTOMKDIR}" ]]; then
        zle -M " path already exists, doing nothing"
    else
        zle -M "$(mkdir -p -v "${PATHTOMKDIR}")"
        zle end-of-line
    fi
}

# custom-tmux-scroll-up - Acticate tmux copy-mode and scroll up
function custom-tmux-scroll-up() {
    if (! (( $+commands[tmux] )) || [[ "$TMUX" == '' ]]) {
        return 1
    }

    tmux copy-mode

    if [[ "$KEYS" == ^U ]] {
        tmux send-keys -X scroll-up
    }
}
