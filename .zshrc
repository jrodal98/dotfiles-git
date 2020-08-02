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
export PATH="$HOME/.gem/ruby/2.7.0/bin:$HOME/.local/bin/:$HOME/bin:$HOME/.cargo/bin:$PATH"
export EDITOR='nvim'
export TERMINAL='kitty'
ZSH_THEME="bira"

plugins=(
    zsh-autosuggestions
    zsh-vim-mode
    colored-man-pages
    extract
    autojump
    dotbare
    zsh-syntax-highlighting
)
# use the vi navigation keys in menu completion
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history


source $ZSH/oh-my-zsh.sh
# bind ctrl + space to accept autocomplete suggestion
bindkey '^j' autosuggest-accept
