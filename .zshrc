alias copy_to_clipboard='xclip -selection clipboard'
alias paste_from_clipboard='xclip -o -selection clipboard'
alias grade_manager='python3 ~/Projects/Grade_Manager/src/gui.py'
alias fuck='eval "sudo $(fc -ln -1)"'
alias notify-after='/home/jake/.config/scripts/notify-after/notify-after'
alias backup-system='notify-after sudo /home/jake/.config/scripts/backup-system/backup-system'
alias open='rifle'
# alias open='xdg-open'
alias todo="taskell $HOME/todo.md"
alias notepad='nvim ~/Notes/notepad.md'
alias ce='~/Projects/conf-edit/conf-edit'

setopt rm_star_silent
export ZSH="/home/jake/.oh-my-zsh"
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="$HOME/.local/bin/:$HOME/bin:$HOME/.cargo/bin:$PATH"
export EDITOR='nvim'
export TERMINAL='alacritty'
ZSH_THEME="bira"

plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  colored-man-pages  
  extract
)

source $ZSH/oh-my-zsh.sh

