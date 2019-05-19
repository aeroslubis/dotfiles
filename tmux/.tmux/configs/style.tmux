# Mode
# set-option -g mode-bg brightblack
# set-option -g mode-fg default
set-option -g mode-style bg=brightblack,fg=default
set -g set-titles on
set-option -g set-titles-string '#{pane_current_command}'

# Status update interval
set-option -g status-interval 5

# Basic status bar colors
# set-option -g status-bg default
# set-option -g status-fg white
set-option -g status-style bg=default,fg=white

# Split
# set-option -g pane-active-border-fg brightblack
# set-option -g pane-active-border-bg default
# set-option -g pane-border-fg brightblack
# set-option -g pane-border-bg default
set-option -g pane-border-style bg=default,fg=brightblack
set-option -g pane-active-border-style bg=default,fg=brightblack

# Status
set -g status-left ''
set -g @prefix_highlight_fg 'white' # default is 'colour231'
set -g @prefix_highlight_bg '#383838'  # default is 'colour04'
set -g status-right '#{prefix_highlight}'
set -g status-right-length 48
set -g status-bg default

# Window status
set-option -g status-position bottom
# setw -g window-status-format '#[fg=white,bold,bg=black] #I #[fg=white,bold,bg=black] #W '
# setw -g window-status-current-format '#[fg=black,bg=red] #I #[fg=white,bg=black,bold] #W '

setw -g window-status-format '#[fg=white,bg=black] #W '
setw -g window-status-current-format '#[fg=white,bg=#383838] #W '

# Pane number indicator
set-option -g display-panes-colour brightblack
set-option -g display-panes-active-colour brightwhite

# Message
# set-option -g message-bg default
# set-option -g message-fg default
set-option -g message-style bg=yellow,fg=black
