# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda-mod"
# ZSH_THEME="honukai"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# mysql
alias mysql=/usr/local/mysql/bin/mysql
alias mysqladmin=/usr/local/mysql/bin/mysqladmin
alias mysqldump=/usr/local/mysql/bin/mysqldump
alias curl=/usr/local/opt/curl/bin/curl

alias git=hub

alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

# v8
alias d8="$HOME/Documents/cybai/v8/out/x64.debug/d8"
alias tick-processor="$HOME/Documents/cybai/v8/tools/mac-tick-processor"

# Activate NVM
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"

# Editor env for Hyperterm
export EDITOR="vim"

# Add `depot_tools` to PATH
export DEPOT_TOOLS_PATH="$HOME/depot_tools"
export PATH="$PATH:$DEPOT_TOOLS_PATH"

# cargo bin
export PATH="$PATH:$HOME/.cargo/bin"

# Setup yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Setup for chromedriver
export PATH="$PATH:$HOME/.bin"

# Default `cd` action for rui_service
cd () {
  builtin cd $@ && checkRUIVersion
}

checkRUIVersion () {
  curDir=${PWD##*/}
  parentDirFull="$(dirname $PWD)"
  parentDir=${parentDirFull##*/}
  ruiRe=^rui_?.+$
  ruiV2Re=^(rui_)?.+v2(_mobile)?$

  if [ "$curDir" =~ $ruiRe ] || [ "$parentDir" =~ $ruiRe ] ; then  
    if [ "$curDir" =~ $ruiV2Re ] ; then
      if [[ `node -v` != *"6.0"* ]] ; then
        nvm use 6.0.0
      fi
    else
      if [[ `node -v` != *"0.10.36"* ]] ; then
        nvm use 0.10.36
      fi
    fi
  else
    if [[ `node -v` != *"6.0"* ]] ; then
      nvm use 6.0.0
    fi
  fi
}


# Define MySQL Docker IP
# export DOCKER_MYSQL_HOST=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' ruiservicev2_mysql_1)

