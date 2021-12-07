# vim: ft=tmux

# Update status interval
set -g status-interval 90

# Prefix Highlight plugin
set -g @prefix_highlight_fg 'ffffff'
set -g @prefix_highlight_bg '2f3244'
set -g @prefix_highlight_output_prefix ''
set -g @prefix_highlight_output_suffix ''
set -g @prefix_highlight_copy_mode_attr "fg=#ffffff,bg=#262626,bold"

# Options
set -g status "on"

# Layout
set -g status-justify "centre"
set -g status-left-style "none"

# Colors
set -g status-style "none,bg=#262626"

# Panes
set -g pane-border-style "fg=#303030"
set -g pane-active-border-style "fg=#0a7aca"

# Messages
set -g message-style "fg=#ffffff,bg=#303030"
set -g message-command-style "fg=#ffffff,bg=#303030"

# Status
set -g status-right-length "100"
set -g status-left-length "100"
set -g status-left "#[fg=#ffffff,bg=#0a7aca,bold] #U #[fg=#0a7aca,bg=#303030,nobold,nounderscore,noitalics]#[fg=#ffffff,bg=#303030] #S #[fg=#303030,bg=#262626,nobold,nounderscore,noitalics]#[fg=#ffffff,bg=#262626] #[fg=#262626,bg=#262626,nobold,nounderscore,noitalics]"
set -g status-right "#{prefix_highlight}#[fg=#303030,bg=#262626,nobold,nounderscore,noitalics]#[fg=#ffffff,bg=#303030] %d/%m/%Y #[fg=#0a7aca,bg=#303030,nobold,nounderscore,noitalics]#[fg=#ffffff,bg=#0a7aca,bold] #{hostname_short} "

# Windows
setw -g window-status-style "none,fg=#ffffff,bg=#262626"
setw -g window-status-activity-style "none,fg=#0a7aca,bg=#262626"
setw -g window-status-separator ""
setw -g window-status-format "#[fg=#262626,bg=#262626,nobold,nounderscore,noitalics]#[fg=#ffffff] #I  #W #[fg=#262626,bg=#262626,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#262626,bg=#303030,nobold,nounderscore,noitalics]#[fg=#ffffff,bg=#303030] #I  #W #[fg=#303030,bg=#262626,nobold,nounderscore,noitalics]"
