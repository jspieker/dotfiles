##################
# Basic settings #
##################

DEFAULT_USER="$USER"            # Suppress machine name in zsh
export ZSH=~/.oh-my-zsh         # Path to oh-my-zsh installation.
ZSH_THEME="agnoster"            # Theme

###########
# Plugins #
###########

plugins=(git safe-paste)
source $ZSH/oh-my-zsh.sh

. `brew --prefix`/etc/profile.d/z.sh # Z plugin

# zsh-syntax-highlighting
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='ag -g ""'

###########
# Aliases #
###########

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#########
# Other #
#########

# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/texbin:/Users/Jannik/.vimpkg/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/texbin:~/.vimpkg/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
