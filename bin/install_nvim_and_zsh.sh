#!/usr/bin/env bash
# www.jrodal.dev

# get started with my neovim and zsh setup quickly.


function os_specific_install() {
    echo "Choose debian or arch based install"
    select os in "debian" "arch"; do
        case $os in
            debian )
                echo "Updating system and installing neovim + zsh..."
                apt-get update && apt-get upgrade && apt-get install neovim python3-neovim zsh
                break;;
            arch )
                echo "Updating system and installing neovim + zsh..."
                pacman -Syu neovim python-pynvim zsh
                break;;
            * ) echo "select one of the possible options (1, 2, etc)"
        esac
    done

    echo "Installing nodejs..."
    curl -sL install-node.now.sh/lts | bash
}

function common_install() {
    echo "Changing default shell to zsh..."
    chsh -s $(which zsh)

    echo "Installing yarn..."
    npm install --global yarn

    echo "Installing starship..."
    curl -fsSL https://starship.rs/install.sh | bash

    echo "Installing zgen..."
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

    if [ -f "${HOME}/.zshrc" ]; then
        echo "Backing up current .zshrc"
        mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak$(date +%s)"
    fi

    if [ -f "${HOME}/.config/starship.toml" ]; then
        echo "Backing up starship config..."
        mv "${HOME}/.config/starship.toml" "${HOME}/.config/starship.toml.bak$(date +%s)"
    fi

    if [ -d "${HOME}/.config/nvim" ]; then
        echo "Backing up current nvim config directory"
        mv "${HOME}/.config/nvim" "${HOME}/.config/nvim_bak$(date +%s)"
    fi

    if [ -d "${HOME}/.config/coc/" ]; then
        echo "Backing up current coc config"
        mv "${HOME}/.config/coc" "${HOME}/.config/coc_bak$(date +%s)"
    fi

    echo "Downloading dotfiles to temporary directory..."
    temp_dir=$(mktemp -d)
    git clone https://github.com/jrodal98/dotfiles.git "$temp_dir/dotfiles"

    mkdir -p "${HOME}/.config"

    echo "Installing relevant dotfiles to proper locations"
    mv "$temp_dir/dotfiles/.zshrc" "${HOME}/.zshrc"
    mv "$temp_dir/dotfiles/.config/starship.toml" "${HOME}/.config/starship.toml"
    mv "$temp_dir/dotfiles/.config/nvim" "${HOME}/.config/nvim"
    mv "$temp_dir/dotfiles/.config/coc" "${HOME}/.config/coc"

    cur_dir=$(pwd)
    cd "${HOME}/.config/coc/extensions/"
    yarn install
    cd ${cur_dir}

    echo "Deleting temporary dotfile directory"
    rm -r ${temp_dir}
}

sudo bash -c "$(declare -f os_specific_install); os_specific_install"
common_install

echo "Installation complete!"
