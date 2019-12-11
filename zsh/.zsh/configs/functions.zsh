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
    local song_position
    song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
        fzf --query="$1" --reverse --select-1 --exit-0 | \
        sed -n 's/^\([0-9]*\)).*/\1/p'
    ) || return 1
    [ -n "$song_position" ] && mpc -q play $song_position
}

# i3open - Open application on spesific i3 workspace
i3open() {
    while getopts "w:" opt; do
        case ${opt} in
            w ) workspace="workspace $OPTARG;" ;;
            h ) echo "open -w [workspace] [command]"; exit 1 ;;
            * ) exit 1 ;;
        esac
    done

    [ $# -eq 0 ] && exit 1

    shift $(($OPTIND -1))
    i3-msg $workspace "exec --no-startup-id $@" &> /dev/null
}

# dot - View or edit configuration file
dot() {
    local dotfile file key
    IFS=$'\n'
    dotfile=("$(fd . $HOME/Repository/mydotfiles --hidden --type file --exclude '.git/*' \
        --exclude 'README.md' --exclude '.gitignore' | \
        fzf --exit-0 --expect=ctrl-o --preview=' \
            bat {} || cat {} 2>/dev/null;')")

    key=$(head -1 <<< "$dotfile")
    file=$(head -2 <<< "$dotfile" | tail -1)
    if [ -n "$file" ]; then
        case "$key" in
            ctrl-o) $EDITOR "$file" ;;
            *) less "$file" ;;
        esac
    fi
}

# virtualenvd - Source virtualenv wrapper
virtualenvd() {
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/bin/virtualenvwrapper.sh
    echo "workon <env> -> to activate environtment"
    echo "deactivate -> to deactivate environtment"
}

# fkill - kill processes - list only the ones you can kill
fkill() {
    local pid 
    pid=$(ps -u $UID -o pid,uname,pcpu,pmem,bsdtime,comm --sort -pcpu \
            | sed 1d | fzf -m | awk '{print $1}')

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# n - nnn cd on quit
n ()
{
    # Block nesting of nnn in subshells
    if [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn -d -o -E "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# tm - Create new tmux session, or swhitch to existing one
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -n 'main' -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# Open vim on spesific directory
editor() {
    if [[ $# -eq 0 ]]; then
        local dir=$(pwd)
    else
        local dir=$1
    fi

    if [[ -n "$TMUX" ]]; then
	tmux new-window -n 'editor' -c $dir $EDITOR
    else
	echo >&2 "No tmux session found."
    fi
}

# Open preview window
peek() {
    if [[ -n "$TMUX" ]]; then
        tmux split-window -p 33 $PAGER $@ || exit;
    else
        echo >&2 "No tmux session found."
    fi
}

# cl - cd to directory and list files
function cl () {
    emulate -L zsh
    cd $1 && ls -a
}

# smart cd function, allows switching to /etc when running 'cd /etc/fstab'
function cd () {
    if (( ${#argv} == 1 )) && [[ -f ${1} ]]; then
        [[ ! -e ${1:h} ]] && return 1
        print "Correcting ${1} to ${1:h}"
        builtin cd ${1:h}
    else
        builtin cd "$@"
    fi
}

# cdt - Create temporary directory and \kbd{cd} to it
function cdt () {
    builtin cd "$(mktemp -d)"
    builtin pwd
}

# accessed - List files which have been accessed within the last {\it n} days, {\it n} defaults to 1
function accessed () {
    emulate -L zsh
    print -l -- *(a-${1:-1})
}

# change - List files which have been changed within the last {\it n} days, {\it n} defaults to 1
function changed () {
    emulate -L zsh
    print -l -- *(c-${1:-1})
}

# modified - List files which have been modified within the last {\it n} days, {\it n} defaults to 1
function modified () {
    emulate -L zsh
    print -l -- *(m-${1:-1})
}

# gg - View git commit
function dd() {
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
