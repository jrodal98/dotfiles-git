alias copy_to_clipboard='xclip -selection clipboard'
alias paste_from_clipboard='xclip -o -selection clipboard'
alias grade_manager='python3 ~/Projects/Grade_Manager/src/gui.py'
alias fuck='eval "sudo $(fc -ln -1)"'
alias notify-after='/home/jake/.config/scripts/notify-after/notify-after'
alias backup-system='sudo /home/jake/.config/scripts/backup-system/backup-system'
# alias open='rifle'
# alias open='xdg-open'
alias todo='todo.sh'
alias notepad='micro ~/Notes/notepad.md'
alias ce='~/Projects/conf-edit/conf-edit'

setopt rm_star_silent
export ZSH="/home/jake/.oh-my-zsh"
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="$HOME/.local/bin/:$HOME/bin:$HOME/.cargo/bin:$PATH"
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


# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#




