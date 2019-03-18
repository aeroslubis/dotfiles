# Initialize the prompt system.
promptinit

# Pure prompt configs
# PURE_CMD_MAX_EXEC_TIME=30
PURE_PROMPT_SYMBOL=❯❯
PURE_PROMPT_VICMD_SYMBOL=❮❮
# Prompt theme.
prompt pure

# Primary prompt with additional tweaks.
# typeset -g PROMPT='%(?.%F{white}.%F{red})❯%f '

# ZLE hooks for prompt's vi mode status
# function zle-line-init zle-keymap-select {
# 	# Change the cursor style depending on keymap mode.
# 	if [[ "$SSH_CONNECTION" == '' ]] {
# 		case $KEYMAP {
# 			vicmd)
# 				printf '\e[0 q' # Box.
# 				;;
# 
# 			viins|main)
# 				printf '\e[6 q' # Vertical bar.
# 				;;
# 		}
# 	}
# }
# zle -N zle-line-init
# zle -N zle-keymap-select
