### Installation

    cd ~
    git clone https://github.com/viszu/dotfiles.git

Vim plugins are installed as a git submodules, so:

    cd dotfiles
    git submodule update --init

### Generate symlinks

    ln -s ~/dotfiles/profile ~/.profile
    ln -s ~/dotfiles/bashrc ~/.bashrc
    ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
    ln -s ~/dotfiles/gitconfig ~/.gitconfig
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vimrc ~/.vimrc
    ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/ackrc ~/.ackrc
    ln -s ~/dotfiles/redshift.conf ~/.config/redshift.conf
    ln -s ~/dotfiles/radiotray.xml ~/.local/share/radiotray/bookmarks.xml

Or use install.sh:

    cd ~/dotfiles/bin
    sh install.sh

### Remove symlinks

    rm ~/.profile
    rm ~/.bashrc
    rm ~/.bash_aliases
    rm ~/.gitconfig
    rm -r ~/.vim
    rm ~/.vimrc
    rm ~/.tmux.conf
    rm ~/.ackrc
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
