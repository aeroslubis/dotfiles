# Common aliases
alias ls="ls -v --classify --color=always --group-directories-first"
alias ll="ls -lh"
alias la="ls -a"
alias lk="ll -S" # Sorted by size
alias lm="ll -t" # Sorted by modified date
alias lM="ll -tr" # Sorted by created date
alias cp="cp -v"
alias mv="mv -v"
alias cpg="cpg -g" # cp with progress bar
alias mvg="mvg -g" # mv with progress bar
alias o='sx-open'
alias p="less"

# Global Aliases
alias -g L='| less'
alias -g G='| grep'
alias -g NE='2>/dev/null' # No sterr.
alias -g NO='&>/dev/null' # No stout and sterr (shorthand for 1>/dev/null 2>&1).
alias -g NOUT='1>/dev/null 2>/dev/null'

alias dirspace='du --max-depth=1 --si'
alias freespace='df -H /dev/sda4 /dev/sda6'
alias extract="patool extract"
alias feh="feh --scale-down -g 1280x720"
alias wifi="nmcli device wifi"
alias reloadshell="exec \$SHELL -l"
alias note="$PAGER ~/Documents/notes/index.md"
alias enote="$EDITOR ~/Documents/notes/index.md"
alias psmem='ps auxf | sort -nr -k 4 | head -10' # get top process eating memory
alias pscpu='ps auxf | sort -nr -k 3 | head -10' # get top process eating cpu ##
alias chromium-dev="chromium --disable-web-security --user-data-dir"
alias dim="xbacklight -set 0.2"
alias ip-public="curl http://ipecho.net/plain"
alias aria2d="aria2c --enable-rpc --rpc-secret=4jCAtTQBbsxuNhC9HMzB7dYwCzviW6ku \
    --rpc-listen-port=7850 --no-conf \
    2>/dev/null 1>/dev/null"
alias dmesg="dmesg --color=always"
alias ip='ip -color' 
alias tmuxa="tmux attach-session -t $TMUX_SESSION_NAME"
alias clipcopy="xclip -in -selection clipboard"
alias clippaste="xclip -out -selection clipboard"
alias arduino="arduino-cli"
alias screen="miniterm.py"
alias logs="tail -n 50 -f /var/log/Xorg.0.log"
alias get-winpos="xdotool getwindowfocus getwindowgeometry"

# if user is not root, pass all these commands via sudo #
if [ $UID -ne 0 ]; then
    alias wifi-menu='sudo wifi-menu'
    alias fdisk='sudo fdisk'
fi

alias help="tldr"
alias 2pdf="libreoffice --headless --invisible --convert-to pdf"
alias imdb-rename="imdb-rename --data-dir /mnt/drive-d/Data/imdb-rename"
alias vbox="vboxmanage"
alias n="ncmpcpp -q"
alias elinks="elinks -config-dir $XDG_CONFIG_HOME/elinks/"
