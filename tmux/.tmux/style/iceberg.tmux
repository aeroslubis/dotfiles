# vim: ft=tmux

# Prefix Highlight plugin
set -g @prefix_highlight_fg 'c6c8d1'
set -g @prefix_highlight_bg '2f3244'
set -g @prefix_highlight_output_prefix ''
set -g @prefix_highlight_output_suffix ''
set -g @prefix_highlight_output_prefix "#[fg=#2e3244]#[bg=#1e2132]#[nobold]#[noitalics]#[nounderscore]#[bg=#2e3244]#[fg=#c6c8d1]"
set -g @prefix_highlight_output_suffix "#[bg=#2e3244]#[fg=#1e2132]#[nobold]#[noitalics]#[nounderscore]"
set -g @prefix_highlight_copy_mode_attr "fg=#c6c8d1,bg=#1e2132,bold"

# Options
set -g status "on"

# Layout
set -g status-justify "centre"
set -g status-left-style "none"

# Colors
set -g status-style "none,bg=#1e2132"

# Panes
set -g pane-border-style "fg=#2e3244"
set -g pane-active-border-style "fg=#454b68"

# Messages
set -g message-style "fg=#c6c8d1,bg=#2e3244"
set -g message-command-style "fg=#c6c8d1,bg=#2e3244"

# Status
set -g status-left "#[fg=#c6c8d1,bg=#454b68,bold] #(whoami) #[fg=#454b68,bg=#1e2132,nobold,nounderscore,noitalics]"
set -g status-right "#{prefix_highlight}#[fg=#2e3244,bg=#1e2132,nobold,nounderscore,noitalics]#[fg=#c6c8d1,bg=#2e3244] #(hostname -i | awk {'print $1'}) #[fg=#454b68,bg=#2e3244,nobold,nounderscore,noitalics]#[fg=#c6c8d1,bg=#454b68,bold] #H "

# Windows
setw -g window-status-style "none,fg=#c6c8d1,bg=#1e2132"
setw -g window-status-activity-style "none,fg=#454b68,bg=#1e2132"
setw -g window-status-separator ""
setw -g window-status-format "#[fg=#1e2132,bg=#1e2132,nobold,nounderscore,noitalics]#[fg=#c6c8d1] #I  #W #[fg=#1e2132,bg=#1e2132,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#1e2132,bg=#2e3244,nobold,nounderscore,noitalics]#[fg=#c6c8d1,bg=#2e3244] #I  #W #[fg=#2e3244,bg=#1e2132,nobold,nounderscore,noitalics]"
