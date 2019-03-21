#!/bin/bash

# zshrc
usedDefined=`sed -n '/# UsedDefined start/,/# UsedDefined end/p' $HOME/.zshrc`
cp -rf $ZSH/templates/zshrc.zsh-template $HOME/.zshrc
if [ -z "$usedDefined" ]; then
    echo "# UsedDefined start" >> $HOME/.zshrc
    echo "# UsedDefined end" >> $HOME/.zshrc
else
  echo "${usedDefined}" >> $HOME/.zshrc
fi

# vim vundle
env vim -u $HOME/.oh-my-zsh/templates/vimrc.zsh-template +PluginInstall +qall
env vim -u $HOME/.oh-my-zsh/templates/vimrc.zsh-template +PluginUpdate +qall

# git config
cp -rf $ZSH/templates/gitconfig.zsh-template $HOME/.gitconfig

# history
cat $ZSH/templates/history.zsh-template >> $HOME/.zsh_history
export LC_ALL="C"
sort $HOME/.zsh_history | sort -o $HOME/.zsh_history
