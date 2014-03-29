# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(github)

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
alias vagrant='nocorrect vagrant'

# rbenv
export RBENV_ROOT=/usr/local/opt/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# Credentials
[[ -s "$HOME/.rackspace_myplanet" ]] && source "$HOME/.rackspace_myplanet"
[[ -s "$HOME/.aws_patcon" ]] && source "$HOME/.aws_patcon"

alias td="todo.sh -t -d $HOME/.todo.cfg"

# Load key into ssh-agent if not loaded
ssh-add -L | grep $USER 1>/dev/null || ssh-add

# added by travis gem
[ -f /home/patcon/.travis/travis.sh ] && source /home/patcon/.travis/travis.sh

# CLI copy-paste
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
