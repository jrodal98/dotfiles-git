alias copy_to_clipboard='xclip -selection clipboard'
alias paste_from_clipboard='xclip -o -selection clipboard'
alias grade_manager='python3 ~/Projects/Grade_Manager/src/gui.py'
alias fuck='eval "sudo $(fc -ln -1)"'
alias notify-after='/home/jake/.config/scripts/notify-after/notify-after'
alias backup-system='sudo /home/jake/.config/scripts/backup-system/backup-system'
# alias open='rifle'
# alias open='xdg-open'
alias todo='todo.sh'
alias notepad='nvim ~/Notes/notepad.md'
alias ce='~/Projects/conf-edit/conf-edit'

setopt rm_star_silent
export ZSH="/home/jake/.oh-my-zsh"
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="$HOME/.local/bin/:$HOME/bin:$HOME/.cargo/bin:$PATH"
export EDITOR='nvim'
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"

plugins=(
  # git
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages  
)

source $ZSH/oh-my-zsh.sh

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
	os_icon 
	dir 
	vcs 
	#newline 
	#prompt_char
	)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs command_execution_time)

POWERLEVEL9K_OS_ICON_BACKGROUND='231'
POWERLEVEL9K_OS_ICON_FOREGROUND='012'

POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print_icon "LEFT_SUBSEGMENT_SEPARATOR") "

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0

POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='011'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'

