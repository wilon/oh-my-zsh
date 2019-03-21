#!/usr/bin/env zsh

zmodload zsh/datetime

function _upgrade_zsh() {
  cat $HOME/.zsh_commits_new > $HOME/.zsh_commits_old
  env ZSH=$ZSH sh $ZSH/tools/upgrade.sh
}

# Cancel upgrade if the current user doesn't have write permissions for the
# oh-my-zsh directory.
[[ -w "$ZSH" ]] || return 0
# Cancel upgrade if git is unavailable on the system
whence git >/dev/null || return 0

# empty .zsh_commits_new
if [ ! -f $HOME/.zsh_commits_new ]; then
  env wget -b -a /dev/null -O $HOME/.zsh_commits_new https://api.github.com/repos/wilon/oh-my-zsh >/dev/null
fi

# lock check when api limit
if [ ! -s $HOME/.zsh_commits_new ]; then

  return 0
fi

# lock check update time
current=`date +%s`
system=`uname -s`
if [ "$system" = "Linux" ];then
  last_modified=`stat -c "%Y" $HOME/.zsh_commits_new`
else
  last_modified=`stat -f %m $HOME/.zsh_commits_new`
fi
if [ $(($current-$last_modified)) -lt 300 ]; then
  return 0
fi

# empty .zsh_commits_old
if [ ! -f $HOME/.zsh_commits_old ]; then
  env wget -b -a /dev/null -O $HOME/.zsh_commits_old https://api.github.com/repos/wilon/oh-my-zsh >/dev/null
fi

# check & tip
diff $HOME/.zsh_commits_old $HOME/.zsh_commits_new >/dev/null
old_update_at=`cat ~/.zsh_commits_old | grep pushed_at | head -n 1`
new_update_at=`cat ~/.zsh_commits_new | grep pushed_at | head -n 1`
if [ "$old_update_at" = "$new_update_at" ]; then
    # echo "[Oh Wilon Zsh] is the lastest."
else
  if [ "$DISABLE_UPDATE_PROMPT" = "true" ]; then
    _upgrade_zsh
  else
    echo "[Oh My Zsh] Would you like to check for updates? [Y/n]: \c"
    read line
    if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
      _upgrade_zsh
    fi
  fi
fi

# down last commits
env wget -b -a /dev/null -O $HOME/.zsh_commits_new https://api.github.com/repos/wilon/oh-my-zsh >/dev/null