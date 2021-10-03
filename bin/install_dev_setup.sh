#!/usr/bin/env bash
# www.jrodal.com

# get started with my neovim and zsh setup quickly.

set -x
set -e

TS=$(date +%s)
TMP_DOTFILES_DIR='/tmp/jrodal_dotfiles'

# TODO

# Installation of LSP

# Add a select for...
# install all
# install selection
# install selection + those after it

function os_specific_install() {
    echo "Choose debian or arch based install"
    # TODO: add docker and mac options
    select os in "debian" "arch"; do
        case $os in
            debian )
                echo "Updating system and installing neovim + zsh..."
                apt-get update && apt-get upgrade && apt-get install neovim python3-neovim zsh tmux bat ripgrep python3-venv autojump
                break;;
            arch )
                echo "Updating system and installing neovim + zsh..."
                pacman -Syu neovim python-pynvim zsh tmux bat ripgrep
                break;;
            * ) echo "Invalid selection"
        esac
    done
}

function backup() {
    if [[ -e "$1" ]]; then
        echo "Backing up $1"
        mv "$1" "$1.bak"
    fi
}

function cp_with_backup() {
    backup "$2"
    cp -r "$1" "$2"
}

function setup() {
    mkdir -p "${HOME}/.config"
    mkdir -p "${HOME}/bin"

    rm -rf "${TMP_DOTFILES_DIR}"
    echo "Downloading dotfiles to ${TMP_DOTFILES_DIR}..."
    git clone https://github.com/jrodal98/dotfiles.git "${TMP_DOTFILES_DIR}"
}

function install_zsh() {
    command -v zsh | sudo tee -a /etc/shells
    echo "Changing default shell to zsh..."
    chsh -s $(which zsh)
    cp_with_backup "${TMP_DOTFILES_DIR}/.zshrc" "${HOME}/.zshrc"
}


function install_starship() {
    echo "Installing starship..."
    curl -fsSL https://starship.rs/install.sh | bash
    cp_with_backup "${TMP_DOTFILES_DIR}/.config/starship.toml" "${HOME}/.config/starship.toml"
}

function install_zgen() {
    echo "Installing zgen..."
    git clone https://github.com/tarjoilija/zgen.git 
}

function install_nvim() {
    # nvim is an OS specific install, but the dotfiles aren't
    echo "Installing relevant dotfiles to proper locations"
    cp_with_backup "${TMP_DOTFILES_DIR}/.config/nvim" "${HOME}/.config/nvim"

    echo "Creating python venv"
    python3 -m venv ~/.config/nvim/nvim_venv
    "$HOME/.config/nvim/nvim_venv/bin/pip" install pylint black

    ln -s ~/.config/nvim/nvim_venv/bin/black ~/bin/black
    ln -s ~/.config/nvim/nvim_venv/bin/pylint ~/bin/pylint
}

function install_mcfly() {
    curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sh -s -- --git cantino/mcfly
}

function install_tmux() {
    # already installed in OS specific section
    echo "installing tmux"
    cp_with_backup "${TMP_DOTFILES_DIR}/.tmux.conf" "${HOME}/.tmux.conf"
}

function cleanup() {
    echo "Deleting temporary dotfile directory"
    rm -r "${TMP_DOTFILES_DIR}"
}

setup
sudo bash -c "$(declare -f os_specific_install); os_specific_install"
install_starship
install_zgen
install_zsh
install_nvim
install_tmux
install_mcfly
cleanup


echo "Installation complete!"
