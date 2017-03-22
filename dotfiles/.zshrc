# Path to your oh-my-zsh configuration.
export ZSH=$HOME/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# export ZSH_THEME="arrow"
# export ZSH_THEME="garyblessington"
export ZSH_THEME=laribee

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git docker node npm yarn vundle rvm ruby brew bundler coloredmanpages vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

autoload -U compinit && compinit
autoload colors && colors

bindkey "^[" vi-cmd-mode

source ~/.zsh-exports.zsh
source ~/.zsh-history.zsh
source ~/.zsh-set_options.zsh
source ~/.zsh-completion.zsh
source ~/.zsh-aliases.zsh

unsetopt auto_name_dirs
