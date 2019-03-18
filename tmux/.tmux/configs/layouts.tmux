# newsboat
bind-key K \
    new-window -n newsboat newsboat --quiet \; \
    set-window-option allow-rename off \; \
    rename-window '  news'

# htop
bind-key H \
    new-window -n htop 'htop' \; \
    set-window-option allow-rename off \; \
    rename-window '  htop'

# nnn
bind-key N \
    new-window -n file 'nnn' \; \
    set-window-option allow-rename off \; \
    rename-window '  file'

# mutt
bind-key M \
    new-window -n mail 'mutt' \; \
    set-window-option allow-rename off \; \
    rename-window '  mail'

# ncmpcpp
bind-key S \
    new-window -n music 'ncmpcpp' \; \
    set-window-option allow-rename off \; \
    rename-window '  music'

bind-key D \
    new-window -n downloader -c $HOME/Downloads/Youtubes \; \
    send-keys 'mknow' 'Enter' \; \
    split-window -h -c $HOME \; \
    split-window -v -c /mnt/drive-d/Download \; \
    select-pane -L \; \
    set-window-option allow-rename off \; \
    rename-window '  downloader'


# weechat 
bind-key C \
    new-window -n chat 'TERM=screen-256color weechat' \; \
    set-window-option allow-rename off \; \
    rename-window '  chat'

bind-key V \
    new-window -n stat \; \
    send-keys 'graph-cpu' 'Enter' \; \
    split-window -h \; \
    send-keys 'graph-memory' 'Enter' \; \
    split-window -v \; \
    send-keys 'graph-network' 'Enter' \; \
    select-pane -L \; \
    split-window -v \; \
    send-keys 'graph-temp' 'Enter' \; \
    set-window-option allow-rename off \; \
    rename-window 'stat'
