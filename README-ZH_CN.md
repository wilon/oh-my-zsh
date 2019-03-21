<p align="center">
  <img src="https://s3.amazonaws.com/ohmyzsh/oh-my-zsh-logo.png" alt="Oh My Zsh">
</p>

[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) is an open source, community-driven framework for managing your [zsh](http://www.zsh.org/) configuration.

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/wilon/oh-my-zsh/master/tools/install.sh)"`

Set a simple bash config.
`curl -fsSL https://raw.githubusercontent.com/wilon/oh-my-zsh/master/tools/simple_install.sh | bash -`

# 我的自定义*oh-my-zsh*
取消默认shell为`zsh`

### *zshrc*配置
参见`$ZSH/templates/zshrc.zsh-template`

### 自动配置*vim*
1. 安装 `Vundle.vim`
2. 配置 `Vundle` 插件
3. 配置我的 `vimrc`
    `vimrc`模板文件 `$ZSH/templates/vimrc.zsh-template`;
    而真正的配置在项目 [wilon/vim-myvimrc](https://github.com/wilon/vim-myvimrc) 里;

### *git*配置
参见`$ZSH/templates/gitconfig.zsh-template`

### 同步历史记录
    sh $ZSH/tools/merge_history.sh
会保存本地history并去重，更新到项目中。然后可以`git push`

### 自动更新
取消原有13天更新机制，改为按本项目commit更新。即项目有push，再进*oh-my-zsh*会提示更新。

# 自定义命令 alias

* `cd -[TAB]`    历史命令
* `php54 -v`    php5.4
* `php56 -v`    php5.6
* `php70 -v`    php7.0
* `php71 -v`    php7.1
* `wvim [FILE]`    自定义vim
* `killgrep [STRING]`    搜索结束进程
* `st [FILE/DIR]`    Sublime Text 打开文件/目录
* `stdir`    进入 Sublime Text 程序目录
* `chromeext`    进入 Chrome 程序扩展目录
* `macws`    进入 mac workspace 目录
* `ifengws`    进入 linux ifeng web 目录
* `lnmpws`    进入 linux lnmp web 目录
* `wn`    进入 nginx 配置目录
