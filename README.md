# Dotfiles

![alt text](Pictures/screenshots/desktop.png "My desktop")

This repo contains most of my configuration files for my Arch Linux + i3Gaps ThinkPad T470s laptop.  Currently, my configuration for the following software is in the repo:

1) i3-gaps
2) polybar
3) ranger
4) zsh
5) st terminal
6) nvim
7) dunst
8) alacritty

and probably other things.

- A list of all of my pacman packages is in [packages.txt](packages.txt)

More recent pictures and a more complete software list can be seen on [my website](https://www.jrodal.dev/configuration.html).

## dotfile management

* I'm using [dotbare](https://github.com/kazhala/dotbare), whose configuration lives inside my .zshrc
* I use githooks, which are listed in .githooks. Run `dotbare config core.hooksPath ~/.githooks` upon cloning the repository.
