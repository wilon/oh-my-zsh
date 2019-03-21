#!/bin/bash

#
# A simple bash config
# Git & Vim & Inputrc
#

main() {
    if which tput >/dev/null 2>&1; then
        ncolors=$(tput colors)
    fi
    if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
        GREEN="$(tput setaf 2)"
        NORMAL="$(tput sgr0)"
    else
        GREEN=""
        NORMAL=""
    fi

    # git
    wget https://raw.githubusercontent.com/wilon/oh-my-zsh/master/templates/gitconfig.zsh-template -O ~/.gitconfig || {
        printf "Error: download .gitconfig failed\n"
        exit 1
    }

    # vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    wget https://raw.githubusercontent.com/wilon/oh-my-zsh/master/templates/vimrc.zsh-template -O ~/.wvimrc || {
        printf "Error: download vimrc failed\n"
        exit 1
    }
    echo "alias wvim='vim -u ~/.wvimrc'" >> ~/.bashrc
    vim -u ~/.wvimrc +PluginInstall +qall
    alias wvim='vim -u ~/.wvimrc'

    # inputrc
    wget https://raw.githubusercontent.com/wilon/oh-my-zsh/master/templates/inputrc.zsh-template -O ~/.inputrc || {
        printf "Error: download inputrc failed\n"
        exit 1
    }

    printf "${GREEN}"
    echo 'Git & Vim & Inputrc config is now update!'
    echo ''
    echo 'p.s. Fork me at https://github.com/wilon/oh-my-zsh.'
    echo ''
    printf "${NORMAL}"
}
main
