# take - Create directory and cd to it
function take() {
    command mkdir --parents --verbose "$1" && cd "$1"
}

# tre - List contents of directories in a tree-like format.
function tre() {
    tree -aC -I '.git|node_modules|.pioenv|.piolibdeps' \
        --dirsfirst "$@" | less;
}

# mknow - Create directory with current date as the name
function mknow() {
    local dirname=$(date +%a_%d%m%Y)
    if [ -d $dirname ]; then
        cd $dirname
    else
        take $dirname
    fi
}

# fmpc - List current mpd playlist with fzf
function fmpc() {
    local songs="$(mpc -f "%position%) %artist% - %title%" playlist \
                   | fzf --query="$1" --reverse --select-1 --exit-0 \
                   | sed -n 's/^\([0-9]*\)).*/\1/p')"
    [[ -n "$songs" ]] && mpc -q play $songs
}

# dot - View or edit configuration file
function dot() {
    local dotfile file key
    dotfile="$(git -C $HOME/Repository/mydotfiles ls-files \
               | fzf --exit-0 --expect=ctrl-o --preview=' \
                 bat $HOME/Repository/mydotfiles/{} 2>/dev/null;')"
    key=$(head -1 <<< "$dotfile")
    file="$HOME/Repository/mydotfiles/$(head -2 <<< "$dotfile" | tail -1)"

    [[ ! -n $file ]] && return
    case "$key" in
        ctrl-o) $EDITOR "$file" ;;
             *) $PAGER "$file"  ;;
    esac
}

# fkill - kill processes - list only the ones you can kill
function fkill() {
    local pid 
    pid="$(ps -u $UID -o pid,uname,pcpu,pmem,bsdtime,comm --sort -pcpu \
          | sed 1d \
          | fzf -m \
          | awk '{print $1}')"

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# n - nnn cd on quit
function n() {
    # Block nesting of nnn in subshells
    if [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn -dEoQx "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# tm - Create new tmux session, or swhitch to existing one
function tm() {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [ $1 ]; then
        tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -n 'main' -s $1 && \
            tmux $change -t "$1"); return
    fi
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) && \
        tmux $change -t "$session" || echo "No sessions found."
}

# editor - Open vim on spesific directory
function editor() {
    [[ $# -eq 0 ]] && dir="$(pwd)" || dir="$1"

    if [[ -n "$TMUX" ]]; then
        tmux new-window -n 'editor' -c $dir $EDITOR
    else
        echo >&2 "No tmux session found."
    fi
}

# gg - View git commit with fzf
function gg() {
    local filter
    if [ -n $@ ] && [ -f $@ ]; then
      filter="-- $@"
    fi

    git log \
        --graph --color=always --abbrev=7 --format='%C(auto)%h %an %C(blue)%s %C(yellow)%cr' $@ | \
        fzf \
            --ansi --no-sort --reverse --tiebreak=index \
            --preview "f() { set -- \$(echo -- \$@ | grep -o '[a-f0-9]\{7\}'); [ \$# -eq 0 ] || git show --color=always \$1 $filter; }; f {}" \
            --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                      (grep -o '[a-f0-9]\{7\}' | head -1 |
                      xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                      {}
                      FZF-EOF" \
            --preview-window=right:60% \
            --height 80%
}

# fclone - copy rclone remote file to current directory
function fclone() {
    local filename="$(rclone ls --max-depth 1 gdrive:/ | fzf | cut -d' ' -f2-)"
    if [[ -n $filename ]]; then
        echo "Downloading $filename"
        rclone copy --progress "gdrive:/$filename" "$(pwd)"
    fi
}

# tarpv - create tar archive with progress bar
function tarpv() {
    [[ ${#argv} < 2 ]] && return
    local dirsize=$(du -sb "$1" | awk '{print $1}')
    tar cf - "$1" -P | pv -s $dirsize > "$2"
}

# ve - select python virtualenv environtment
function ve() {
    local ve="$(find $HOME/.virtualenv -maxdepth 1 -mindepth 1 -type d | fzf)"
    [[ ! -z $ve ]] && source $ve/bin/activate
}

# passcp - copy password from password-store
function passcp() {
    local pass_file="$(find $HOME/.password-store -type f \
                       | grep -E '\.gpg$' \
                       | sed -e "s/.*password-store\///" \
                       | sed -e "s/\.gpg$//" \
                       | fzf)"
    pass -c $pass_file
}
