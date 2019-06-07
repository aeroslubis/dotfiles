# -*- mode: sh; -*-
# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# default appclication
export EDITOR='vim'
export PAGER='less'
# export VISUAL='mousepad'
export BROWSER='firefox'
export FILE='nnn'
export PLAYER='mpv --no-video'
export TERMINAL='termite'

# PATH
export PATH=$HOME/.node/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.bin:$PATH
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
export PATH=$HOME/Codes/Bash/bin:$PATH
export PATH=$HOME/Codes/Python/bin:$PATH
export PATH=$HOME/Codes/Perl/bin:$PATH

# dircolors
eval $(dircolors --sh "$HOME/.dircolors")

# fasd
eval $(fasd --init zsh-hook)

# virtualenv wrapper
# export WORKON_HOME=~/.virtualenvs
# source /usr/bin/virtualenvwrapper.sh

# direnv
# eval "$(direnv hook zsh)"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Show dot file on top
export LC_COLLATE="C"

# nnn configs
export NNN_USE_EDITOR=1
export NNN_BMS='d:~/Downloads;'
       NNN_BMS+='s:~/Sandbox;'
       NNN_BMS+='F:/mnt/drive-d/Files;'
       NNN_BMS+='D:/mnt/drive-d;'
       NNN_BMS+='T:/mnt/drive-d/Torrents;'
       NNN_BMS+='M:/mnt/drive-d/Files/Music;'
       NNN_BMS+='m:~/Media;'
       NNN_BMS+='u:/media/usbdrive'
# export NNN_SCRIPT=~/.config/nnn/scripts
export NNN_COPIER=~/.config/nnn/copier
export NNN_NOTE=~/.config/nnn/note
export NNN_CONTEXT_COLORS="4231"
export NNN_TMPFILE=/tmp/nnn
export NNN_RESTRICT_NAV_OPEN=1
export NNN_RESTRICT_0B=1
# export NNN_OPS_PROG=1
export NNN_NO_AUTOSELECT=1
export NNN_CP_MV_PROG=1

export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
export PYLINTHOME="$XDG_CONFIG_HOME/pylint.d"
export PYLINTRC="$PYLINTHOME/pylintrc"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"
export UMCONFIG_HOME="$XDG_CONFIG_HOME/um"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"

# fzf
export FZF_DEFAULT_COMMAND="rg \
	--files \
	--no-messages \
	--no-ignore \
	--hidden \
	--follow \
	--ignore-case \
	--glob '!{.git,node_modules}/*'"
export FZF_DEFAULT_COLORS='--color=dark,fg:7,fg+:7,bg:0,bg+:8,hl:4,hl+:4,info:8,border:8,prompt:4,pointer:3,marker:3,spinner:8,header:6'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_COLORS \
	--exact \
	--no-bold \
	--inline-info \
	--height='40%' \
	--jump-labels='bmvenritusldkfjgh' \
	--bind='ctrl-f:jump-accept'"

# highlight
export HIGHLIGHT_OPTIONS="--line-numbers \
    --line-number-length=2 \
    --out-format=xterm256 \
    --base16 \
    --style=tomorrow-night"

# less
export LESS=" \
	--ignore-case \
	--tilde \
	--chop-long-lines \
	--status-column \
	--LONG-PROMPT \
	--jump-target=10 \
	--RAW-CONTROL-CHARS \
	--clear-screen \
	--silent \
	--tabs=4 \
	--shift=5"
# export LESSOPEN="| highlight $HIGHLIGHT_OPTIONS -- %s 2>/dev/null" # Use `highlight` program to try to highlight opened file according to its extension.
export LESSOPEN="| bat -n %s 2>/dev/null" # Use `bat` program to syntax-wise highlight files.
export LESSHISTFILE="$HOME/.config/less/lesshistory" # Command and search history file.
export LESSKEYRC="$HOME/.config/less/lesskey" # Path of the uncompiled lesskey file.
export LESSKEY="$LESSKEYRC.lwc" # Path of the compiled lesskey file.
export LESS_TERMCAP_md=$(tput bold; tput setaf 4) # Turn on bold mode.
export LESS_TERMCAP_me=$(tput sgr0) # Turn off all attributes.
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # Begin standout mode.
export LESS_TERMCAP_se=$(tput rmso; tput sgr0) # Exit standout mode.
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 250) # Begin underline mode.
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0) # Exit underline mode.
export LESS_TERMCAP_mr=$(tput rev) # Turn on reverse video mode.
export LESS_TERMCAP_mh=$(tput dim) # Turn on half-bright mode.
export LESS_TERMCAP_ZN=$(tput ssubm) # Enter subscript mode.
export LESS_TERMCAP_ZV=$(tput rsubm) # End subscript mode.
export LESS_TERMCAP_ZO=$(tput ssupm) # Enter superscript mode.
export LESS_TERMCAP_ZW=$(tput rsupm) # End superscript mode.

# Default tmux session name
export TMUX_SESSION_NAME="aeroslubis"

# ampy
export AMPY_PORT=/dev/ttyUSB0
export AMPY_BAUD=115200

# instagram-crawler sessionid
export sessionid="2040578353%3A3GmtM2FgEX71pg%3A1"
