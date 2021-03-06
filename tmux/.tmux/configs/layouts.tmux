# elinks
bind-key W \
    new-window -n web "elinks -config-dir ~/.config/elinks/" \; \
    set-window-option allow-rename off \; \
    rename-window 'web'

# htop
bind-key H \
    new-window -n htop 'htop' \; \
    set-window-option allow-rename off \; \
    rename-window 'htop'

# nnn
bind-key N \
    new-window -n file 'nnn -dEoQxe' \; \
    set-window-option allow-rename off \; \
    rename-window 'file'

# mutt
bind-key M \
    new-window -n mail 'neomutt' \; \
    set-window-option allow-rename off \; \
    rename-window 'mail'

# music player
bind-key S \
    new-window -n music 'ncmpcpp -q' \; \
    split-window -h 'pulsemixer' \; \
    split-window -v 'nnn -d' \; \
    set-window-option allow-rename off \; \
    rename-window 'music'
