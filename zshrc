# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

ZSH_THEME="lambda-mod"
plugins=(git docker env)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.bin"

source $ZSH/oh-my-zsh.sh

# mysql
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias mysqldump=/usr/local/mysql/bin/mysqldump
alias curl=/usr/local/opt/curl/bin/curl

# alias git=hub

alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

# Activate NVM
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"

# Editor env for Hyperterm
export EDITOR="vim"

# cargo bin
export PATH="$PATH:$HOME/.cargo/bin"

# Setup yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Activate rbenv
eval "$(rbenv init -)"

# Activate goenv
if which goenv > /dev/null; then eval "$(goenv init -)"; fi

# Setup for Servo
export PKG_CONFIG_PATH=$(brew --prefix libffi)/lib/pkgconfig
