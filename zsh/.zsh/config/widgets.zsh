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
    custom-insert-last-typed-word
    custom-tmux-scroll-up
    custom-fzf-launch-from-history
    custom-fzf-execute-widget
    custom-fzf-select-dir
) {
    eval zle -N $widget
}
unset widget

# Expand global alias to its full form.
function custom-expand-global-alias() {
    if [[ "$LBUFFER" =~ ' [A-Z0-9]+$' ]] {
        zle _expand_alias
    }

    zle self-insert
}

# Insert last typed word for quick copy-paste.
function custom-insert-last-typed-word() {
    zle insert-last-word -- 0 -1
}

# Activate tmux copy-mode and scroll up depending on key stroke.
function custom-tmux-scroll-up() {
    if (! hash tmux &>/dev/null || [[ "$TMUX" == '' ]]) {
        return 1
    }

    tmux copy-mode

    # "$KEYS" == ^Y
    if [[ "$KEYS" ==  ]] {
        tmux send-keys -X scroll-up

    # "$KEYS" == ^U
    } elif [[ "$KEYS" ==  ]] {
        tmux send-keys -X halfpage-up
    }
}

# Select command from history into the command line.
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

# Execute Zsh Line Editor widgets.
function custom-fzf-execute-widget() {
    if (! hash fzf &>/dev/null) {
        return 1
    }

    local selected=$(
        zle -al \
            | command grep --extended-regexp --invert-match '(^orig|^\.|^_)' \
            | fzf \
                --tac \
                --nth='2..,..' \
                --tiebreak='index' \
                --prompt=':'
    )

    local stat=$?

    if [[ "$selected" != '' ]] {
        zle $selected
    }

    return $stat
}

function custom-fzf-select-dir() {
    builtin typeset READLINE_LINE_NEW="$(
            command find -L . \( -path '*/\.*' -o -fstype dev -o -fstype proc \) \
                    -prune \
                    -o -type f -print \
                    -o -type d -print \
                    -o -type l -print 2>/dev/null \
            | command sed 1d \
            | command cut -b3- \
            | env fzf -m
    )"

    if
            [[ -n $READLINE_LINE_NEW ]]
    then
            builtin bind '"\er": redraw-current-line'
            builtin bind '"\e^": magic-space'
            READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${READLINE_LINE_NEW}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
            READLINE_POINT=$(( READLINE_POINT + ${#READLINE_LINE_NEW} ))
    else
            builtin bind '"\er":'
            builtin bind '"\e^":'
    fi
}
