# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

ZSH_THEME="lambda-mod"
plugins=(git docker env zsh-autosuggestions)

export EDITOR="vim"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.bin:$HOME/.local/bin:$HOME/Library/Python/3.7/bin"

export LC_ALL=en_US.UTF-8

source $ZSH/oh-my-zsh.sh

alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'

alias cat=bat
alias ls=exa

# cargo bin
export PATH="$PATH:$HOME/.cargo/bin"

# Setup yarn
export PATH="$PATH:$HOME/.yarn/bin"

# cabal bin
export PATH="$PATH:$HOME/.cabal/bin"

. /Users/cybai/.nix-profile/etc/profile.d/nix.sh

# Hook direnv
eval "$(direnv hook zsh)"

# For groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Activate goenv
# export GOENV_ROOT=$HOME/.goenv
# export PATH=$GOENV_ROOT/bin:$PATH
# if which goenv > /dev/null; then eval "$(goenv init -)"; fi

# Setup for Servo
export PKG_CONFIG_PATH=$(brew --prefix libffi)/lib/pkgconfig
export PKG_CONFIG_PATH="$(brew --prefix zlib)/lib/pkgconfig/:$PKG_CONFIG_PATH"

# LLVM
# export LDFLAGS="-L/usr/local/opt/llvm/lib"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export LDFLAGS="-L/usr/local/opt/libffi/lib"

# export CPPFLAGS="-I/usr/local/opt/llvm/include"
# export PATH="/usr/local/opt/llvm/bin:$PATH"

export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"

# Chromium
export PATH="$PATH:/Volumes/Transcend/codespace/chromium/depot_tools"

# Hook opam env
#eval $(opam env)

