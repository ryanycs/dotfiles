#!/usr/bin/bash

vim-plug() {
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

starship() {
    curl -sS https://starship.rs/install.sh | sh
}

install() {
    # install vim-plug
    if [ ! -f ~/.vim/autoload/plug.vim ]; then
        echo "installing vim-plug..."
        vim-plug
    fi
    cp .vimrc ~
    vim -c :PlugInstall -c :q -c :q
        
    # install starship
    if [ ! -f /usr/local/bin/starship ]; then
        echo "installing starship..."
        starship
    fi
    cp starship.toml ~/.config/
}

install
