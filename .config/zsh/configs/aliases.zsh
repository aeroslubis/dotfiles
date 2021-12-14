# Global aliases
alias -g L='| less'
alias -g G='| grep'
alias -g NE='2>/dev/null'
alias -g NO='&>/dev/null'
alias -g NOUT='1>/dev/null 2>/dev/null'

# Common aliases
alias ls="ls -v --classify --color=always --group-directories-first"
alias ll="ls -lh"
alias la="ls -a"
alias lk="ll -S"   # Sorted by size
alias lm="ll -t"   # Sorted by modified date
alias lM="ll -tr"  # Sorted by created date
alias cp="cp -v"
alias mv="mv -v"
alias o='xdg-open'
alias p="less"
alias df='df --all --si --print-type'

alias dirspace='du --max-depth=1 --si'
alias feh="feh --scale-down -g 1280x720"
alias reloadshell="exec \$SHELL -l"
alias note="$PAGER ~/Documents/notes/index.md"
alias enote="$EDITOR ~/Documents/notes/index.md"
alias dim="xbacklight -set 0.2"
alias aria2d="aria2c --enable-rpc --rpc-secret=4jCAtTQBbsxuNhC9HMzB7dYwCzviW6ku \
    --rpc-listen-port=7850 --no-conf \
    2>/dev/null 1>/dev/null"
alias dmesg="dmesg --color=always"
alias ip='ip -color' 
alias clipcopy="xclip -in -selection clipboard"
alias clippaste="xclip -out -selection clipboard"
alias screen="miniterm.py"
alias logs="tail -n 50 -f /var/log/Xorg.0.log"
alias help="tldr"
alias 2pdf="libreoffice --headless --invisible --convert-to pdf"
alias imdb-rename="imdb-rename --data-dir $HOME/.cache/imdb-rename"
alias m="ncmpcpp -q"
alias elinks="elinks -config-dir $XDG_CONFIG_HOME/elinks/"
alias gpg-forget="gpg-connect-agent reloadagent /bye"
alias get="curl -LO"

# if user is not root, pass all these commands via sudo #
if [ $UID -ne 0 ]; then
    alias wifi-menu='sudo wifi-menu'
    alias fdisk='sudo fdisk'
fi

# oh-my-zsh systemd plugins
user_commands=(
    list-units is-active status show help list-unit-files
    is-enabled list-jobs show-environment cat list-timers)

sudo_commands=(
    start stop reload restart try-restart isolate kill
    reset-failed enable disable reenable preset mask unmask
    link load cancel set-environment unset-environment
    edit)

for c in $user_commands; do; alias sc-$c="systemctl $c"; done
for c in $sudo_commands; do; alias sc-$c="sudo systemctl $c"; done
for c in $user_commands; do; alias scu-$c="systemctl --user $c"; done
for c in $sudo_commands; do; alias scu-$c="systemctl --user $c"; done

alias gs='git status'
