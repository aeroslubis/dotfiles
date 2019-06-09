##
# Makes directory and `cd`s into it.
#
# @param {string} $1 Directory name that will be created.
##
function take() {
    command mkdir --parents --verbose "$1" && cd "$1"
}

##
# `fasd` with `fzf`.
##
function f() {
    local selected_path=$(
        fasd -l -d \
        | sed "s#$HOME#~#" \
        | fzf \
            --tac \
            --no-sort \
            --exact \
            --prompt='cd ' \
            --preview-window='right:60%' \
            --preview='eval ls -l --si --almost-all --classify --color=always --group-directories-first --literal {} 2>/dev/null'
    )

    eval cd "$selected_path"
}

##
# Bookmark manager.
#
# @param {string} [$1] Defined bookmark string.
##
function b() {
    # Bookmarks
    local -A bookmarks=(
        's' '~/Sandbox/'
        'c' '~/Codes/'
        'd' '~/Downloads/'
        'D' '/mnt/drive-d/'
        'p' '~/Pictures/'
        'F' '/mnt/drive-d/Files/'
        'M' '/mnt/drive-d/Files/Music/'
        'm' '~/Media/'
        'u' '/media/usbdrive/'
        'r' '~/Repo/dotfiles'
    )

    local selected_bookmark

    if [[ "$1" != '' ]] {
        selected_bookmark="${bookmarks[$1]}"
    } else {
        local bookmarks_table

        local key
        foreach key (${(k)bookmarks}) {
            bookmarks_table+="$key ${bookmarks[$key]}\n"
        }

        if (! hash fzf &>/dev/null) {
            return 1
        } else {
            selected_bookmark=$(
                printf "$bookmarks_table" \
                | fzf \
                    --exact \
                    --height='30%' \
                    --preview='eval ls -l --si --almost-all --classify --color=always --group-directories-first --literal {2} 2>/dev/null' \
                    --preview-window='right:60%' \
            )

            selected_bookmark="${selected_bookmark[(ws: :)2]}"
        }
    }

    if [[ "$selected_bookmark" != '' ]] {
        eval cd "$selected_bookmark"
    } else {
        return 1
    }
}

# lman: Open the manual page for the last command you executed.
function lman() {
    local cmd

    set -- $(fc -nl -1)
    while [ $# -gt 0 -a '(' "sudo" = "$1" -o "-" = "${1:0:1}" ')' ]; do
        shift
    done

    cmd="$(basename "$1")"
    man "$cmd" > /dev/null || "$cmd" --help > /dev/null || "$cmd" -h > /dev/null
}


# List contents of directories in a tree-like format.
function tre() {
    tree -aC -I '.git|node_modules|bower_components|.DocumentRevisions-V100|.fseventsd' \
        --dirsfirst "$@" | less;
}

#  function stop() {
#   if [ $# -ne 1 ]; then
#       echo 1>&2 Usage: stop process
#   else
#       PROCESS=$1
#       echo "Stopping processes with the word ${tGreen}$1${tReset}"
#       ps axw | grep -i $1 | awk -v PROC="$1" '{print $1}' | xargs kill -s TERM
#   fi
#  }

# Create directory with current date as a name
function mknow() {
    local dirname=$(date +%a_%d%m%Y)
    if [ -d $dirname ]; then
        cd $dirname
    else
        take $dirname
    fi
}

# Get local ips
function ip-local() {
    ifconfig wlo1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "wlo1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
    ifconfig eno1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "eno1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# List current mpd playlist with fzf
function fmpc() {
    local song_position
    song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
        fzf-tmux --query="$1" --reverse --select-1 --exit-0 | \
        sed -n 's/^\([0-9]*\)).*/\1/p'
    ) || return 1
    [ -n "$song_position" ] && mpc -q play $song_position
}

# Copy file or directory from clipboard to current directory
function cpv() {
    local copy_from=$(cat $XDG_CONFIG_HOME/nnn/.selection)
    if [ -z $copy_from ]; then
        echo "No file(s) to copy!"
        return 1
    fi
    if [ -z "$1" ]; then
        local copy_to="$PWD"
    else
        if [ -d "$1" ]; then
            local copy_to="$1"
        else
            echo "Destination folder doesn't exist!"
            return 1
        fi
    fi

    echo -n "Copy $copy_from -> $copy_to? [Y/n] "; read
    if [[ $REPLY =~ ^[y,Y]$ ]]; then
        cp -v "$copy_from" "$copy_to"
    else
        return 1
    fi

    # [[ -z $1 ]] && local paste_path="$PWD" || local paste_path="$1"
    # echo -n "Copy $(basename $copy_path) to $paste_path? [Y/n] "; read

    # if [[ $REPLY =~ ^[y,Y]$ ]]; then
    #   [[ -d $paste_path ]] && cp $copy_path $paste_path \
    #       && echo "Copied: $(basename $copy_path) to $paste_path"
    # else
    #   return 1
    # fi
}

add_alias() {
    [[ $# -eq 0 ]] && { echo "Usage: add_alias [alias] [alias to]"; return 1; }
    alias="$1=\"$2\""
    echo -n "Add $alias to zsh aliases? [Y/n] "; read

    if [[ $REPLY =~ ^[y,Y]$ ]]; then
        echo "alias $alias" >> $ZDOTDIR/config/aliases.zsh
    fi
}

# Create python file and add shebang
py() {
    if [[ $# -eq 0 ]]; then
        python
    else
        echo "#! python3\n\"\"\"\n\n\"\"\"" > $1
        vim $1
    fi
}

imgur() {
    curl -sk "http://i.filmot.org/$(echo $1 | grep -o '[^/]*$')" | feh -
}

termux-ssh() {
    local regex='([1-9]?[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])'
    if [[ $1 =~ ^$regex\.$regex\.$regex\.$regex$ ]]; then
        TERM="xterm" ssh $1 -p 8022 -l ~/.ssh/id_rsa
    else
        echo "Wrong ip format"
        return 1
    fi
}

font-test() {
    echo -e '\e[3mThis is an italic text. \e[23m'
    echo -e "\033[4mThis is an underlined line.\033[0m"
    echo -e "\e[1mThis is an bold text\e[0m"
}

# Open application on spesific i3 workspace
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

youtube-pl() {
    local youtube_videos=$(yutube-dl --dump-json --flat-playlist $1)
    echo "Downloading $(echo $youtube_videos > /dev/null | wc -l) videos"
    parallel --progress -j3 youtube-dl --config-location ~/.config/youtube-dl/youtube-playlist.conf \
        :::: <(echo $youtube_videos > /dev/null | jq --raw-output '.url')
}

# Fuzzy find man pages and open it whith zathura
manview() {
    man -Tpdf $(man -k . | awk '{print $1}' | uniq | fzy -l 20) | zathura -
}

# Start stop deluge bittorrent client
deluged-kill() {
    if pgrep deluged; then
        echo -n "Kill deluge daemon? [Y/n] "; read
        if [[ $REPLY =~ ^[y,Y]$ ]]; then
            killall deluged
        fi
    else
        deluged
    fi
}

# -------------------------Tmux functions------------------------
# Open vim on spesific directory
editor() {
    if [[ $# -eq 0 ]]; then
        local dir=$(pwd)
    else
        local dir=$1
    fi

    if [[ $TERM =~ st* && -d $dir ]] && $( tmux has-session -t $TMUX_SESSION_NAME 2> /dev/null ); then
        tmux new-window -n '  editor' -c $dir $EDITOR
    else
        echo >&2 "No tmux session found."
    fi
}

# Open preview window
peek() {
    if [[ $TERM =~ st* ]] && $( tmux has-session -t $TMUX_SESSION_NAME 2> /dev/null ); then
        tmux split-window -p 33 $PAGER $@ || exit;
    else
        echo >&2 "No tmux session found."
    fi
}
