alias nvim='env TERM=wezterm nvim'
alias copy_to_clipboard='xclip -selection clipboard'
alias paste_from_clipboard='xclip -o -selection clipboard'
alias fuck='eval "sudo $(fc -ln -1)"'
alias update-system='nma "sudo pacman -Syu";nma "yay -Syu"; pacman -Qqe > ~/packages.txt'
alias todo="taskell $HOME/todo.md"
alias notepad='nvim ~/Notes/notepad.md'
alias lg='lazygit'
alias share_remarkable='reStream.sh -s remarkable -p'

alias yd='yt-dlp'

export DOTBARE_DIR="$HOME/.dotfiles"
export DOTBARE_TREE="$HOME"
alias db='dotbare'

setopt rm_star_silent
export RANGER_LOAD_DEFAULT_RC=FALSE
export PATH="$HOME/go/bin:$HOME/.gem/ruby/2.7.0/bin:$HOME/.local/bin/:$HOME/bin:$HOME/.cargo/bin:$PATH"
export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'
export TERMINAL='wezterm'
alias nnn='nnn -e'
export NNN_FIFO=/tmp/nnn.fifo
export NNN_BMS='v:~/Videos;h:~;p:~/Projects;s:~/School'
export NNN_PLUG='g:-_git diff;p:preview-tui'

# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  zgen oh-my-zsh

  # plugins

  zgen oh-my-zsh plugins/extract
  zgen oh-my-zsh plugins/vi-mode
  zgen oh-my-zsh plugins/colored-man-pages
  zgen oh-my-zsh plugins/autojump # note: install autojump first

  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src

  zgen load kazhala/dotbare

  # generate the init script from plugins above
  zgen save
fi

bindkey -v
# bind ctrl + space to accept autocomplete suggestion
bindkey '^j' autosuggest-accept

eval "$(starship init zsh)"

eval "$(mcfly init zsh)"

touch "${HOME}/.env" && source "${HOME}/.env"
