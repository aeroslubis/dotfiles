# htop
bind-key H \
	new-window -n htop 'TERM=screen-256color htop' \; \
	set-window-option allow-rename off \; \
	rename-window htop

# nnn
bind-key N \
	new-window -n file 'TERM=screen-256color nnn' \; \
	set-window-option allow-rename off \; \
	rename-window file

# mutt
bind-key M \
	new-window -n mail 'TERM=screen-256color mutt' \; \
	set-window-option allow-rename off \; \
	rename-window mail

# ncmpcpp
bind-key S \
	new-window -n music 'TERM=screen-256color ncmpcpp' \; \
	set-window-option allow-rename off \; \

# downloader send-keys 'take $(date +%a_%d%m%Y)' 'Enter'
bind-key D \
	new-window -n downloader -c $HOME/Downloads/Youtubes \; \
	send-keys 'mknow' 'Enter' \; \
	split-window -h -c $HOME \; \
	split-window -fv -c /mnt/drive-d/Download \; \
	select-pane -U \; \
	set-window-option allow-rename off \; \
	rename-window downloader

# weechat 
bind-key C \
	new-window -n chat 'TERM=screen-256color weechat' \; \
	set-window-option allow-rename off \; \
	rename-window chat

#	new-window -n downloader -c $HOME \; \
#	split-window -v -c $HOME/Downloads/Youtubes \; \
#	send-keys 'mknow' 'Enter' \; \
#	select-pane -U \; \
#	split-window -h -c /mnt/drive-d/Download \; \
#	select-pane -D \; \
#	set-window-option allow-rename off \; \
#	rename-window downloader	
	
	
