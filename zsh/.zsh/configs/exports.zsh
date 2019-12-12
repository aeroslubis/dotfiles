# -*- mode: sh; -*-
# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# PATH
export PATH=$HOME/.node/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/scripts:$PATH
# export PATH=$HOME/.bin:$PATH
# export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH

# default appclication
export EDITOR='vim'
export PAGER='less'
export BROWSER='waterfox'
export FILE='nnn'
export PLAYER='mpv --no-video'
export TERMINAL='termite'
export VISUAL='dvim'

# dircolors
eval $(dircolors --sh "$HOME/.dircolors")

# nnn configs
export NNN_USE_EDITOR=1
export NNN_BMS='d:~/Downloads;'
       NNN_BMS+='s:~/Sandbox;'
       NNN_BMS+='F:~/Files;'
       NNN_BMS+='T:~Downloads/Torrents;'
       NNN_BMS+='M:~/Music;'
       NNN_BMS+='p:~/Pictures;'
       NNN_BMS+='u:/mnt;'
       NNN_BMS+='r:~/Repository;'
       NNN_BMS+='R:~/Repository/dotfiles;'
       NNN_BMS+='c:~/.config;'
export NNN_PLUG='i:imgsxiv;'
       NNN_PLUG+='m:boom;'
export NNN_COPIER=~/.config/nnn/copier
export NNN_CONTEXT_COLORS="4231"

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
export LESSOPEN="| bat %s 2>/dev/null" # Use `bat` program to syntax-wise highlight files.
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
