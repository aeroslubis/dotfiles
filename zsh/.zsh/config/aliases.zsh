# ls aliases
alias ls="ls --color=always --group-directories-first"
alias ll="ls -lh"
alias la="ls -a"
alias lk="ls -S"       # Sorted by size
alias lm="ls -t"       # Sorted by modified date
alias lM="ls -tr"      # Sorted by created date

# Command line head / tail shortcuts
alias H='| head'
alias T='| tail'
alias G='| grep -i --color'
alias L="| less"
alias LL="2>&1 | less"
alias CA="2>&1 | cat -A"
alias NE="2> /dev/null"
alias NUL="> /dev/null 2>&1"
alias P="2>&1| pygmentize -l pytb"

alias dirspace='du --max-depth=1 --si'
alias freespace='df -H /dev/sda4 /dev/sda6'
alias o='xdg-open'
# alias c="bat --theme 1337 --style numbers"
alias p="less"
alias extract="patool extract"
alias feh="feh --scale-down -g 1280x720"
alias wifi="nmcli device wifi"

# Configs
alias cvim="$EDITOR ~/.vimrc"
alias cenv="$EDITOR ~/.zsh/config/exports.zsh"
alias calias="$EDITOR ~/.zsh/config/aliases.zsh"
alias cfunctions="$EDITOR ~/.zsh/config/functions.zsh"
alias ci3="$EDITOR ~/.config/i3/config"
alias cpolybar="$EDITOR ~/.config/polybar/config"
alias cxresources="$EDITOR ~/.Xresources"
alias cmerge='xrdb ~/.Xresources'
alias csource="source ~/.zsh/.zshrc"
alias note="$EDITOR ~/Documents/notes/index.md"

alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'
alias psmem='ps auxf | sort -nr -k 4 | head -10' # get top process eating memory
alias pscpu='ps auxf | sort -nr -k 3 | head -10' # get top process eating cpu ##
alias chromium-dev="chromium --disable-web-security --user-data-dir"
alias dim="xbacklight -set 0.2"
alias ip-public="curl http://ipecho.net/plain; echo"
alias aria2d="aria2c --enable-rpc --rpc-listen-all=true --rpc-allow-origin-all"
alias dmesg="dmesg --color=always | less"
alias ip='ip -color' 
alias search="rg \
	--color='always' \
	--heading \
	--line-number \
	--no-messages \
	--no-ignore \
	--hidden \
	--follow \
	--smart-case \
	--glob '!.git/' \
	--glob '!node_modules/' \
	--regexp"

# alias tmuxd="tmux new-session -s 'aeroslubis' -n 'main'"
alias tmuxa="tmux attach-session -t aeroslubis"
alias clipcopy="xclip -in -selection clipboard"
alias clippaste="xclip -out -selection clipboard"
alias arduino="arduino-cli"
alias screen="miniterm.py"
alias logs="tail -n 50 -f /var/log/Xorg.0.log"
# alias italic_test="echo -e '\e[3mThe Quick Brown Fox Jumps Over The Lazy Dog\e[23m'"
alias graph-cpu="sar 1 | gawk '{ print 100-int(\$NF); fflush();  }' | ttyplot -s 100 -t \"cpu usage\" -u \"%\""
alias graph-memory="sar -r 1 | perl -lane 'BEGIN{$|=1} print \"@F[5]\"' | ttyplot -s 100 -t \"memory used %\" -u \"%\""
alias graph-temp="{ while true; do awk '{ printf(\"%.1f\n\", \$1/1000)  }' /sys/class/thermal/thermal_zone0/temp; sleep 1; done  } | ttyplot -t \"cpu temp\" -u C"
alias graph-network="sar  -n DEV 1 | gawk '{ if(\$6 ~ /rxkB/) { print iin/1000; print out/1000; iin=0; out=0; fflush();  } iin=iin+\$6; out=out+\$7;  }' | ttyplot -2 -u \"MB/s\""

# if user is not root, pass all these commands via sudo #
if [ $UID -ne 0 ]; then
	alias wifi-menu='sudo wifi-menu'
	alias fdisk='sudo fdisk'
fi

# Generated by function add_alias
alias getpage="wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories"
alias help="tldr"
alias serve="python ~/Codes/Python/pyserver.py"
alias 2pdf="libreoffice --headless --invisible --convert-to pdf"
alias aria2c="aria2c --file-allocation=none"
alias imdb-rename="imdb-rename --data-dir /mnt/drive-d/Data/imdb-rename"
alias cp="cpg -g"
alias mv="mvg -g"
