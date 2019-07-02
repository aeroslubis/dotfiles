function take() {
    command mkdir --parents --verbose "$1" && cd "$1"
}

function f() {
    local selected_path=$(
        fasd -l \
        | sed "s#$HOME#~#" \
        | fzf \
            --exact \
            --tac \
            --no-sort \
            --prompt='fz ' \
            --preview-window='right:60%' \
            --preview=' \
                CURRENT_ITEM=$(echo {} | sed s#~#$HOME#) && \
                if [ -d $CURRENT_ITEM ]; then; \
                    ls --si --almost-all --classify --color=always --group-directories-first --literal $CURRENT_ITEM; \
                else \
                    bat $CURRENT_ITEM || cat {} 2>/dev/null; \
                fi \
            ' \
    )

    # Expand ~ (tilde) variable.
    selected_path=$(eval echo "$selected_path")

    if ([[ -d "$selected_path" ]]) {
        cd "$selected_path"
    } else {
        $EDITOR "$selected_path"
    }
}

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

# List contents of directories in a tree-like format.
function tre() {
    tree -aC -I '.git|node_modules|.pioenv|.piolibdeps' \
        --dirsfirst "$@" | less;
}

# Create directory with current date as the name
function mknow() {
    local dirname=$(date +%a_%d%m%Y)
    if [ -d $dirname ]; then
        cd $dirname
    else
        take $dirname
    fi
}

# List current mpd playlist with fzf
function fmpc() {
    local song_position
    song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
        fzf --query="$1" --reverse --select-1 --exit-0 | \
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

# Download youtube playlist in parallel
youtube-pl() {
    local youtube_videos=$(youtube-dl --dump-json --flat-playlist $1)
    echo "Downloading $(echo $youtube_videos | wc -l) videos"
    parallel --progress -j3 youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/youtube-playlist.conf \
        :::: <(echo $youtube_videos > /dev/null | jq --raw-output '.url')
}

# Fuzzy find man pages and open it whith zathura
pdfman() {
    man -Tpdf $(man -k . | awk '{print $1}' | uniq | fzy -l 20) | zathura -
}

# View or edit configuration file
dot() {
    local dotfile file key
    IFS=$'\n'
    dotfile=("$(fd . $HOME/Repo/dotfiles --hidden --type file --exclude '.git/*' \
        --exclude 'README.md' --exclude '.gitignore' | \
        fzf --exit-0 --expect=ctrl-o --preview=' \
            bat {} || cat {} 2>/dev/null; \
        ')")
    key=$(head -1 <<< "$dotfile")
    file=$(head -2 <<< "$dotfile" | tail -1)
    if [ -n "$file" ]; then
        case "$key" in
            ctrl-o) $EDITOR "$file" ;;
            *) less "$file" ;;
        esac
    fi
}

# Source virtualenv wrapper
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

cmdview() {
    local file="$(which $1)"
    if [[ -f "$file" ]] && $EDITOR "$file"
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
