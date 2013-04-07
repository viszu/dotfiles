### Installation

    cd ~
    git clone https://github.com/viszu/dotfiles.git

Vim plugins are installed as a git submodules, so:

    cd dotfiles
    git submodule init
    git submodule update

### Generate symlinks

    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/bashrc ~/.bashrc
    ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
    ln -s ~/dotfiles/gitconfig ~/.gitconfig
    ln -s ~/dotfiles/redshift.conf ~/.config/redshift.conf
    ln -s ~/dotfiles/radiotray.xml ~/.local/share/radiotray/bookmarks.xml

Or use install.sh:

    cd ~/dotfiles/bin
    sudo chmod +x install.sh
    sh install.sh

### Remove symlinks

    rm -r ~/.vim
    rm ~/.vimrc
    rm ~/.tmux.conf
    rm ~/.bashrc
    rm ~/.bash_aliases
    rm ~/.gitconfig
    rm ~/.config/redshift.conf
    rm ~/.local/share/radiotray/bookmarks.xml

### Update Vim plugins

    cd dotfiles
    git submodule foreach 'git pull origin master'

### Install new plugins

Example:

    cd dotfiles
    git submodule add https://github.com/nick/what.git vim/bundle/what

    git add .
    git commit -m 'Install what.vim plugin'
