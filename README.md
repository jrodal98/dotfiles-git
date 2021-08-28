# Dotfiles

[![NVIM Docker Image CI](https://github.com/jrodal98/dotfiles/actions/workflows/nvim-docker-image.yml/badge.svg)](https://github.com/jrodal98/dotfiles/actions/workflows/nvim-docker-image.yml)

![alt text](Pictures/screenshots/desktop.png "My desktop")

This repo contains most of my configuration files for my Arch Linux + i3Gaps ThinkPad T470s laptop.  Currently, my configuration for the following software is in the repo:

* window managers
  * i3-gaps
  * qtile
* status bars
  * polybar
* file explorers
  * nnn
* shells
  * zsh
* terminal emulators
  * kitty
  * alacritty
  * st
* text editors
  * neovim v0.5: `docker pull ghcr.io/jrodal98/nvim:latest` for a docker image compatible with amd64 and arm64 architectures
* misc
  * dunst

and probably other things.

- A list of all of my pacman packages is in [packages.txt](packages.txt)

More recent pictures and a more complete software list can be seen on [my website](https://www.jrodal.dev/configuration.html).

## dotfile management

* I'm using [dotbare](https://github.com/kazhala/dotbare), whose configuration lives inside my .zshrc
* I use githooks, which are listed in .githooks. Run `dotbare config core.hooksPath ~/.githooks` upon cloning the repository.
