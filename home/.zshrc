# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"
# Interesting themes:
# - fishy: compacts parent dir names
# - fox: newline for actual commands

# Set a specific theme when on local computer, to avoid confusion
[[ "$(hostname)" == "patcon-thinkpad" ]] && ZSH_THEME="muse"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github rails)

source $ZSH/oh-my-zsh.sh

export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
alias duh='du -csh'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
alias ls='ls --color'
alias diff=colordiff

# Sort dotfiles first with ls
export LC_COLLATE="C"

# Remove specific ZSH autocorrects
alias cookbook='nocorrect cookbook'
alias environment='nocorrect environment'
alias role='nocorrect role'
alias spark='nocorrect spark'
#alias vagrant='nocorrect vagrant'

# Credentials
[[ -s "$HOME/.rackspace_myplanet" ]] && source "$HOME/.rackspace_myplanet"
[[ -s "$HOME/.aws_patcon" ]] && source "$HOME/.aws_patcon"
[[ -s "$HOME/.ghi_patcon" ]] && source "$HOME/.ghi_patcon"
[[ -s "$HOME/.credentials_digitalocean" ]] && source "$HOME/.credentials_digitalocean"
[[ -s "$HOME/.credentials_digitalocean_blendive" ]] && source "$HOME/.credentials_digitalocean_blendive"

alias td="todo.sh -t -d $HOME/.todo.cfg"

# Load key into ssh-agent if not loaded
# NOTE: Doesn't work anymore
ssh-add -L | grep $USER 1>/dev/null || ssh-add

# added by travis gem
[ -f /home/patcon/.travis/travis.sh ] && source /home/patcon/.travis/travis.sh

# CLI copy-paste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Force color (for instance, for ghi tool):
export TERM=xterm-256color

### Set up per-user npm packages (rather than global)

# NPM packages in homedir
NPM_PACKAGES="$HOME/.npm-packages"

# Tell our environment about user-installed node tools
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your configuration
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Tell Node about these packages
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

# rbenv

export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# Better mapping for opening dirs
alias open="gnome-open"

 #AndroidDev PATH

export PATH=${PATH}:$HOME/android/sdk/tools

export PATH=${PATH}:$HOME/android/sdk/platform-tools

# cp with progress bar
# https://bbs.archlinux.org/viewtopic.php?pid=937445#p937445
alias cp_p='rysnc --recursive --progress'

# Alias to start tor browser
alias tor=/home/patcon/tor-browser/start-tor-browser

# Android development
export NDK_BASE=$HOME/android/ndk/android-ndk-r10
export ANDROID_HOME=$HOME/android/sdk

# Add node-webkit to PATH
if [ -d "$HOME/opt/node-webkit" ]; then
    PATH="$PATH:$HOME/opt/node-webkit"
fi

alias git-ls='git ls-tree --full-name --name-only HEAD | while read filename; do echo $(git log -1 --format=%ar -- ${filename##*/})\\t$filename; done'

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

source $HOME/.xinitrc

# Make sure ChefDK bin dir ahead of rbenv bin dir.
# See: https://github.com/berkshelf/vagrant-berkshelf/issues/212#issuecomment-50654257
export PATH=/opt/chefdk/bin:/home/patcon/.chefdk/gem/ruby/2.1.0/bin:$PATH

export EDITOR=vim

# Always run .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# OPAM configuration
. /home/patcon/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source ~/.nvm/nvm.sh
