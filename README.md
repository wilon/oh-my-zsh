<p align="center">
  <img src="https://s3.amazonaws.com/ohmyzsh/oh-my-zsh-logo.png" alt="Oh My Zsh">
</p>

[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) is an open source, community-driven framework for managing your [zsh](http://www.zsh.org/) configuration.

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilon/oh-my-zsh/master/tools/install.sh)"`

Set a simple bash config.
`curl -fsSL https://raw.githubusercontent.com/wilon/oh-my-zsh/master/tools/simple_install.sh | bash -`

# My custom *oh-my-zsh*
The default shell `zsh` is canceled.

### *zshrc* config
Cat `$ZSH/templates/zshrc.zsh-template`

### *wvim* A vim config.
`wvim`, setup vim whith a config file : `$ZSH/templates/vimrc.zsh-template`
My vimrc: [wilon/vim-myvimrc](https://github.com/wilon/vim-myvimrc) 

### *git* config
`$ZSH/templates/gitconfig.zsh-template`

### history record
    sh $ZSH/tools/merge_history.sh
!!! Save the history to this project.

### Auto update
Check update based on this repo commit.

# 自定义命令 alias

* `cd -[TAB]`
* `php54 -v`    php5.4
* `php56 -v`    php5.6
* `php70 -v`    php7.0
* `php71 -v`    php7.1
* `wvim [FILE]`
* `killgrep [STRING]`    
* `st [FILE/DIR]`    Sublime Text open FILE/DIR
* `stdir`    cd Sublime Text programe dir
* `chromeext`    cd Chrome programe dir
* `macws`    cd mac workspace
* `ifengws`    cd linux ifeng web dir
* `lnmpws`    cd linux lnmp web dir
* `wn`    cd nginx config dir
