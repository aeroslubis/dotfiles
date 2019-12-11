# vim: ft=tmux
set -g status-justify "centre"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#c6c8d1,bg=#2e3244"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#454b68"
set -g status-style "none,bg=#1e2132"
set -g message-style "fg=#c6c8d1,bg=#2e3244"
set -g pane-border-style "fg=#2e3244"
set -g status-right-length "100"
set -g status-left-length "100"

set -g @prefix_highlight_fg 'c6c8d1' # default is 'colour231'
set -g @prefix_highlight_bg '2f3244'  # default is 'colour04'

set -g @prefix_highlight_output_prefix ''
set -g @prefix_highlight_output_suffix ''

setw -g window-status-activity-style "none,fg=#454b68,bg=#1e2132"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#c6c8d1,bg=#1e2132"
set -g status-left "#[fg=#c6c8d1,bg=#454b68,bold] #(whoami) #[fg=#454b68,bg=#1e2132,nobold,nounderscore,noitalics]"
# #[fg=#c6c8d1,bg=#1e2132] #{sysstat_mem} #[fg=#1e2132,bg=#1e2132,nobold,nounderscore,noitalics]"

set -g status-right "#[fg=#1e2132,bg=#1e2132,nobold,nounderscore,noitalics]#[fg=#2e3244,bg=#1e2132,nobold,nounderscore,noitalics]#[fg=#c6c8d1,bg=#2e3244] #(hostname -i)#[fg=#454b68,bg=#2e3244,nobold,nounderscore,noitalics]#[fg=#c6c8d1,bg=#454b68,bold] #H #{prefix_highlight}"

setw -g window-status-format "#[fg=#1e2132,bg=#1e2132,nobold,nounderscore,noitalics]#[fg=#c6c8d1] #I  #W #[fg=#1e2132,bg=#1e2132,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#1e2132,bg=#2e3244,nobold,nounderscore,noitalics]#[fg=#c6c8d1,bg=#2e3244] #I  #W #[fg=#2e3244,bg=#1e2132,nobold,nounderscore,noitalics]"