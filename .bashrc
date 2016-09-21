# Path
export PATH="$PATH:$HOME/bin"
# Golang
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
# for quantum calculation
# export PATH="$PATH:$HOME/sw/bin"
# export PATH="$PATH:$HOME/Documents/First-Principles/espresso-5.2.0/bin"

# manをvimで開く
# export MANPAGER="col -b -x|vim -R -c 'set ft=man nolist nomod noma' -"


#Prompt
PS1=' \W '
shopt -s globstar
shopt -s autocd

# default option
alias ls='ls -U'

# Basic Command
alias c='clear'
alias q='exit'
alias r='source ~/.bashrc'
alias rl="exec bash --login"
alias t='type'
alias v='vim'
alias vi='vim'
alias w='which'

#git
alias gl='git log --oneline'

#Aliases for Vim
alias vib="vim ~/.bashrc"
alias viv="vim ~/.vimrc"

if [ -e "${HOME}/.bashrc_local" ]; then
  source "${HOME}/.bashrc_local"
fi

