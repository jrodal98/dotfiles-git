alias copy_to_clipboard='xclip -selection clipboard'
alias paste_from_clipboard='xclip -o -selection clipboard'
alias grade_manager='python3 ~/Projects/Grade_Manager/src/gui.py'
alias fuck='eval "sudo $(fc -ln -1)"'
alias backup-system='notify-after "sudo /home/jake/.config/scripts/backup-system/backup-system"'
alias update-system='notify-after "sudo pacman -Syu";notify-after "yay -Syu"'
alias open='rifle'
# alias open='xdg-open'
alias todo="taskell $HOME/todo.md"
alias notepad='nvim ~/Notes/notepad.md'
alias ce='~/Projects/conf-edit/conf-edit'
alias lg='lazygit'

setopt rm_star_silent
export ZSH="/home/jake/.oh-my-zsh"
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="$HOME/.gem/ruby/2.7.0/bin:$HOME/.local/bin/:$HOME/bin:$HOME/.cargo/bin:$PATH"
export EDITOR='vim'
export TERMINAL='kitty'
ZSH_THEME="bira"

plugins=(
  zsh-autosuggestions
  colored-man-pages  
  extract
  autojump
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# source /etc/profile.d/autojump.zsh
