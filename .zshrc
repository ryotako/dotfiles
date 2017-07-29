# Homebrewed zsh {{{1
alias run-help >/dev/null 2>&1 && unalias run-help
autoload -Uz run-help
export helpdir=/usr/local/share/zsh/help

# Homebrewed zplug {{{1
export ZPLUG_HOME=/usr/local/opt/zplug
source "$ZPLUG_HOME/init.zsh"

## local...
zplug "~/.zsh",         from:local, defer:3

## babarot-ware
source ~/.ghq/github.com/b4b4r07/enhancd/init.sh
zplug "b4b4r07/enhancd", use:init.sh
export ENHANCD_FILTER=peco

# ## filtering tools
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:"fzf"
zplug "motemen/ghq",      as:command, from:gh-r, rename-to:"ghq"
zplug "peco/peco",        as:command, from:gh-r

## mollifier-ware
zplug "mollifier/anyframe"

## zsh-users!!
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

## Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
if ! zplug check; then
    printf "Install? [y/N]: "; read -q && echo && zplug install
fi

## Then, source plugins and add commands to $PATH
zplug load

if [ -f ~/.zshrc_local ];then
  source ~/.zshrc_local
fi

# vim:set fdm=marker ft=zplug cms=#%s:
