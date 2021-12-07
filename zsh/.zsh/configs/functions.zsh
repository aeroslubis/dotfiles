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
    [[ -d $dirname ]] && cd $dirname || take $dirname
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
    local entry="$(git -C $HOME/Repository/mydotfiles ls-files \
        | fzf --layout=reverse \
        --preview 'bat $HOME/Repository/mydotfiles/{} 2>/dev/null;')"

    [[ -n "$entry" ]] && ${EDITOR:-vim} "$HOME/Repository/mydotfiles/$entry"
}

# fkill - kill processes - list only the ones you can kill
function fkill() {
    local pid="$(ps -u $UID -o pid,uname,pcpu,pmem,bsdtime,comm --sort -pcpu \
        | sed 1d | fzf -m | awk '{print $1}')"

    [[ -n $pid ]] && kill -${1:-9} $pid
}

# n - nnn cd on quit
function n() {
    # Block nesting of nnn in subshells
    if [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    nnn -dEoQxeaU "$@"

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

    local session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) && \
        tmux $change -t "$session" || echo "No sessions found."
}

# editor - Open vim on spesific directory
function editor() {
#    [[ ${#argv} < 1 ]] && dir="$(pwd)" || dir="$1"
    local dir="$* : $(pwd)"

    if [[ -n "$TMUX" ]]; then
        tmux new-window -n 'editor' -c $dir $EDITOR
    else
        echo >&2 "No tmux session found."
    fi
}

# fclone - Copy file from remote using rclone
function fclone() {
    [[ ${#argv} < 1 ]] && return
    local remote="$1"
    local filename="$(rclone lsf --files-only --format tp $remote | sort -r -k 1 -k 2 \
         | cut -d';' -f 2 | fzf --ansi --no-sort --exit-0)"

    [[ -z $filename ]] && return

    echo "Downloading $filename"
    rclone copy --progress "$remote$filename" "$PWD"
}

# tarpv - create tar archive with progress bar
function tarpv() {
    [[ ${#argv} < 2 ]] && return
    local dirsize=$(du -sb "$1" | awk '{print $1}')
    tar cf - "$1" -P | pv -s $dirsize > "$2"
}

# ve - select python virtualenv environtment
function ve() {
    local ve="$(find $XDG_DATA_HOME/virtualenv -maxdepth 1 -mindepth 1 -type d | fzf)"
    [[ ! -z $ve ]] && source $ve/bin/activate
}

# passcp - copy password from password-store
function passcp() {
    local pass_file="$(find $XDG_DATA_HOME/password-store -type f \
         | grep -E '\.gpg$' \
         | sed -e "s/.*password-store\///" \
         | sed -e "s/\.gpg$//" \
         | fzf)"
    pass -c $pass_file
}

# readme - open readme.md file on tmux split window
function readme() {
    if [[ -n "$TMUX" ]]; then
        tmux split-window -h 'glow -s dark | less'
    else
        glow -s dark | $PAGER
    fi
}

# eth0 - turn interface eth0 off and on
function eth0() {
    sudo ip link set down eth0
    sudo ip link set up eth0
}

# ssh-forward - forward remote server port
function ssh-forward() {
    ssh -f -N $1 -L $2:127.0.0.1:$2
}

# ovpn-connect openvpn update resolv.conf file
function ovpn-connect() {
    openvpn --setenv PATH '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' \
            --script-security 2 \
            --up /etc/openvpn/update-resolv-conf \
            --down /etc/openvpn/update-resolv-conf \
            --down-pre \
            "$@"
}

function proxy_on() {
    export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com,192.168.1.1"

    if (( $# > 0 )); then
        valid=$(echo $@ | sed -n 's/\([0-9]\{1,3\}.\?\)\{4\}:\([0-9]\+\)/&/p')
        if [[ $valid != $@ ]]; then
            >&2 echo "Invalid address"
            return 1
        fi
        local proxy=$1
        export http_proxy="$proxy" \
               https_proxy=$proxy \
               ftp_proxy=$proxy \
               rsync_proxy=$proxy
        echo "Proxy environment variable set."
        return 0
    fi

    echo -n "username: "; read username
    if [[ $username != "" ]]; then
        echo -n "password: "
        read -es password
        local pre="$username:$password@"
    fi

    echo -n "server: "; read server
    echo -n "port: "; read port
    local proxy=$pre$server:$port
    export http_proxy="$proxy" \
           https_proxy=$proxy \
           ftp_proxy=$proxy \
           rsync_proxy=$proxy \
           HTTP_PROXY=$proxy \
           HTTPS_PROXY=$proxy \
           FTP_PROXY=$proxy \
           RSYNC_PROXY=$proxy
}

function proxy_off(){
    unset http_proxy https_proxy ftp_proxy rsync_proxy \
          HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY
    echo -e "Proxy environment variable removed."
}
