# Mode
set-option -g mode-bg brightblack
set-option -g mode-fg default
set -g set-titles on
set-option -g set-titles-string '#{pane_current_command}'

# Status update interval
set-option -g status-interval 5

# Basic status bar colors
set-option -g status-bg default
set-option -g status-fg white

# Split
set-option -g pane-active-border-fg brightblack
set-option -g pane-active-border-bg default
set-option -g pane-border-fg brightblack
set-option -g pane-border-bg default

# Status
set -g status-left ''
set -g @prefix_highlight_fg 'white' # default is 'colour231'
set -g @prefix_highlight_bg '#383838'  # default is 'colour04'
set -g status-right '#{prefix_highlight}'
# set -g status-right '#{prefix_highlight} #{cpu_icon}#{cpu_percentage} | %a %H:%M '
set -g status-right-length 48
set -g status-bg default

# Configure elemnts to show on right side of the status bar
#set -g status-right-length 48
#set -g status-right "#[fg=colour243,bold] « #[default]"
#set -ga status-right "#{prefix_highlight}"
#set -ga status-right "#[fg=white,bg=colour29,bold] #{d_day_icon} #{d_day_remain}(#{d_day_percentage}) #[default]"
#set -ga status-right "#[fg=white,bg=colour64,bold]#{cpu_percentage} #[default]"
#set -ga status-right "#[fg=colour233,bg=colour15] %Y-%m-%d %a %H:%M #[default]"

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
set-option -g message-bg default
set-option -g message-fg default
