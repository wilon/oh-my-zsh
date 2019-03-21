#!/bin/zsh
source $ZSH/oh-my-zsh.sh

cp -rf $HISTFILE $ZSH/cache/.zsh_history

# merge
cat $ZSH/cache/.zsh_history >> $ZSH/cache/.zsh_history-merge
cat $ZSH/templates/history.zsh-template >> $ZSH/cache/.zsh_history-merge

# unique
export LC_ALL="C"
sort -t ";" -k 2 -u $ZSH/cache/.zsh_history-merge > $ZSH/cache/.zsh_history-tmp

# time sort
sort $ZSH/cache/.zsh_history-tmp > $ZSH/cache/.zsh_history-tmp1

# security
export LC_COLLATE='C'
export LC_CTYPE='C'
sed '/https*:\/\/.*\@/d' $ZSH/cache/.zsh_history-tmp1 > $ZSH/cache/.zsh_history-tmp
sed '/[a-zA-Z0-9]\{40\}/d' $ZSH/cache/.zsh_history-tmp > $ZSH/cache/.zsh_history-tmp1
sed '/wilon[0-9]\{4,9\}/d' $ZSH/cache/.zsh_history-tmp1 > $ZSH/cache/.zsh_history-tmp

# recover
cp -rf $ZSH/cache/.zsh_history-tmp $ZSH/templates/history.zsh-template
cp -rf $ZSH/cache/.zsh_history-tmp $HISTFILE
