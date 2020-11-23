alias copy_to_clipboard='xclip -selection clipboard'
alias paste_from_clipboard='xclip -o -selection clipboard'
alias fuck='eval "sudo $(fc -ln -1)"'
alias update-system='nma "sudo pacman -Syu";nma "yay -Syu"; pacman -Qqe > ~/packages.txt'
alias todo="taskell $HOME/todo.md"
alias notepad='nvim ~/Notes/notepad.md'
alias lg='lazygit'

alias szsh='source ~/.zshrc'
alias yd='youtube-dl'

export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"
alias db='dotbare'

setopt rm_star_silent
export ZSH="/home/jake/.oh-my-zsh"
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="$HOME/go/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.local/bin/:$HOME/bin:$HOME/.cargo/bin:$PATH"
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='bat'
export MANPAGER='bat'
export GIT_EDITOR='nvim'
export TERMINAL='kitty'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_USE_EDITOR=1
export NNN_BMS='v:~/Videos;h:~;p:~/Projects;s:~/School'
export NNN_PLUG='g:-_git diff;p:preview-tui'

ZSH_THEME="bira"

plugins=(
    zsh-autosuggestions
    colored-man-pages
    extract
    autojump
    dotbare
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# bind ctrl + space to accept autocomplete suggestion
bindkey '^j' autosuggest-accept
