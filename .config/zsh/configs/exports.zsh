# Locale
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/.node_modules/bin:$PATH
# export PATH=$(ruby -e 'puts Gem.user_dir')/bin:$PATH

# TERM
if [[ $TERM != "xterm-256color" ]]; then
    TERM="xterm-256color"
fi

# default appclication
export EDITOR='vim'
export PAGER='less'
export BROWSER='chromium'
export FILE='nnn'
export PLAYER='mpv --no-video'
export TERMINAL='kitty'
# export VISUAL='dvim'

export npm_config_prefix="$HOME/.node_modules"
export GOPATH="$HOME/.go"
export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/bat.conf"
export UMCONFIG_HOME="$XDG_CONFIG_HOME/um"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep"
export ELINKS_CONFDIR="$XDG_CONFIG_HOME/elinks"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

# nnn configs
export NNN_OPTS="dEoQxeaU"
export NNN_BMS='d:~/Downloads;'
       NNN_BMS+='s:~/Sandbox;'
       NNN_BMS+='v:~/Videos;'
       NNN_BMS+='p:~/Pictures;'
       NNN_BMS+='u:/run/media;'
       NNN_BMS+='r:~/Repository;'
       NNN_BMS+='c:~/.config;'
export NNN_PLUG='i:imgview;'
       NNN_PLUG+='m:boom;'
       NNN_PLUG+='p:preview-tui;'
       NNN_PLUG+='e:suedit;'
export NNN_COPIER="$XDG_CONFIG_HOME/nnn/copier"
export NNN_COLORS="4231"
export NNN_OPENER="$XDG_CONFIG_HOME/nnn/plugins/nuke"
export NNN_ARCHIVE="\\.(7z|bz2|gz|tar|tgz|zip|rar)$"
export NNN_ORDER='t:$HOME/Downloads'
export NNN_TMPFILE="$XDG_CONFIG_HOME/nnn/.lastd"

# fzf
export FZF_DEFAULT_COMMAND="rg \
    --files \
    --no-messages \
    --hidden \
    --follow \
    --ignore-case \
    --glob '!{.git,node_modules}/*'"
export FZF_DEFAULT_COLORS='--color=dark,fg:-1,bg:-1,hl:4,fg+:7,bg+:8,gutter:-1,hl+:4,info:8,border:8,prompt:4,pointer:3,marker:3,spinner:8,header:6'
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_COLORS \
    --exact \
    --no-multi \
    --no-mouse \
    --height='40%' \
    --layout='reverse' \
    --inline-info \
    --no-bold"

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

# dircolors
eval $(dircolors --sh "$HOME/.dircolors")

BASE16_SHELL=$XDG_CONFIG_HOME/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
