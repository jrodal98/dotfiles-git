# Archived

Archived in favor of https://github.com/jrodal98/dotfiles because...

- I want to start using gnu stow
- Many of these dotfiles are no longer relevant, so I want to start with a (relatively) clean slate

# Dotfiles

![alt text](Pictures/screenshots/desktop.png "My desktop")

This repo contains configurations for various programs I've used over the years. It includes, but is not limited to:

- window managers
  - i3-gaps
  - qtile
- status bars
  - polybar
  - bumblebee
- file explorers
  - nnn
  - ranger
- shells
  - zsh
  - zinit (manager)
  - starship (prompt)
- terminal emulators
  - wezterm
  - kitty
  - alacritty
  - st
- text editors
  - neovim v0.7: `docker pull ghcr.io/jrodal98/nvim:latest` for a docker image compatible with amd64 and arm64 architectures
- misc

  - tmux
  - dunst

- A list of all of my pacman packages is in [packages.txt](packages.txt)

## dotfile management

- I'm using [dotbare](https://github.com/kazhala/dotbare), whose configuration lives inside my .zshrc
- I use githooks, which are listed in .githooks. Run `dotbare config core.hooksPath ~/.githooks` upon cloning the repository.
