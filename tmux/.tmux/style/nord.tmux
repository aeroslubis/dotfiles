# Copyright (C) 2017-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (C) 2017-present Sven Greb <development@svengreb.de>

# Project:    Nord tmux
# Repository: https://github.com/arcticicestudio/nord-tmux
# License:    MIT

#+----------------+
#+ Plugin Support +
#+----------------+
#+--- tmux-prefix-highlight ---+
set -g @prefix_highlight_fg black
set -g @prefix_highlight_bg brightcyan

#+---------+
#+ Options +
#+---------+
set -g status-interval 1
set -g status on

#+--------+
#+ Status +
#+--------+
#+--- Layout ---+
set -g status-justify left

#+--- Colors ---+
set -g status-bg black
set -g status-fg white
set -g status-style none

#+-------+
#+ Panes +
#+-------+

set-option -g pane-border-style bg=black,fg=black
set-option -g pane-active-border-style bg=black,fg=brightblack
set-option -g display-panes-colour black
set-option -g display-panes-active-colour brightblack

#+------------+
#+ Clock Mode +
#+------------+
setw -g clock-mode-colour cyan

#+----------+
#+ Messages +
#+---------+
set-option -g message-style bg=cyan,fg=brightblack
set-option -g message-command-style bg=brightblack,fg=cyan

#+----------------+
#+ Plugin Support +
#+----------------+
#+--- tmux-prefix-highlight ---+
set -g @prefix_highlight_output_prefix "#[fg=brightcyan]#[bg=black]#[nobold]#[noitalics]#[nounderscore]#[bg=brightcyan]#[fg=black]"
set -g @prefix_highlight_output_suffix ""
set -g @prefix_highlight_copy_mode_attr "fg=brightcyan,bg=black,bold"

#+--------+
#+ Status +
#+--------+
#+--- Bars ---+
#set -g status-left "#[fg=black,bg=blue,bold] #S#[fg=blue,bg=black,nobold,noitalics,nounderscore]"
set -g status-left "#[fg=black,bg=blue,bold] #S #[fg=blue,bg=black,nobold,noitalics,nounderscore]"
set -g status-right "#{prefix_highlight}#[fg=brightblack,bg=black,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %Y-%m-%d #[fg=white,bg=brightblack,nobold,noitalics,nounderscore]#[fg=white,bg=brightblack] %H:%M #[fg=cyan,bg=brightblack,nobold,noitalics,nounderscore]#[fg=black,bg=cyan,bold] #H "

#+--- Windows ---+
set -g window-status-format "#[fg=black,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#I #[fg=white,bg=brightblack,nobold,noitalics,nounderscore] #[fg=white,bg=brightblack]#W #F #[fg=brightblack,bg=black,nobold,noitalics,nounderscore]"
set -g window-status-current-format "#[fg=black,bg=cyan,nobold,noitalics,nounderscore] #[fg=black,bg=cyan]#I #[fg=black,bg=cyan,nobold,noitalics,nounderscore] #[fg=black,bg=cyan]#W #F #[fg=cyan,bg=black,nobold,noitalics,nounderscore]"
set -g window-status-separator ""
