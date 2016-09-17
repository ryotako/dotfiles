# プラグイン {{{1
## zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)
## z
source $(brew --prefix)/etc/profile.d/z.sh

# 基本設定 {{{1
# ヘルプ (homebrewでzshを入れた関係で必要)
unalias run-help && autoload run-help
HELPDIR=/usr/local/share/zsh/help

# エディタ，ページャ
export EDITOR=vim PAGER=vimpager
export LANG=ja_JP.UTF-8

# プロンプト
PROMPT='%K{blue}%F{black}%.%f%k '
RPROMPT='[%w %t]'

# 自動補完
autoload -Uz compinit && compinit
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 大文字小文字無視

## オプション
setopt auto_cd auto_pushd pushd_ignore_dups
setopt share_history hist_ignore_all_dups
setopt no_beep
setopt no_correct

## ヒストリ
HISTFILE=~/.zsh_history
HISTFIZE=1000000
SAVEHIST=1000000

# エイリアス {{{1
## デフォルトオプションの設定
alias ls='ls -G'
alias blockdiag='blockdiag --antialias'

## 短縮表記
alias a=alias , c=clear , q=exit , t=type , w=which
alias vi=vim

## 設定ファイルへのアクセス
alias ,b='vim ~/.bashrc'
alias ,g='vim ~/.gitconfig'
alias ,p='vim ~/.config/peco/config.json'
alias ,v='vim ~/.vimrc'
alias ,v='vim ~/.vimrc'
alias ,z="vim ~/.zshrc && exec $SHELL"

## 拡張子エイリアス
alias -s {vimrc,gvimrc,bashrc,zshrc}=$EDITOR
alias -s {txt,dat,md,markdown,tex}=$EDITOR
if [ $(uname) = 'Darwin' ]; then
  alias -s {png,jpg,bmp,PNG,JPG,BMP}='open'
  alias -s {pdf}='open'
fi
alias -s go='go run'

# グローバルエイリアス
alias -g F='|fzf'
alias -g G='|egrep'
alias -g P='|peco'

# その他
alias history-all='history -n 1'
alias div="tr ' ' '\n'"

# ペコる
alias j='cd "$(z | sort -rn | cut -c 12- | peco)"'
alias h='$(history -n 1 | peco)'
alias s='cd $(ghq list --full-path | peco)'
alias brewlabels='for B in $(brew list);do echo "$B: "$(brew info $B | sed -n "2p") ; done'

# その他 {{{1
function showoptions() {
  set -o | sed -e 's/^no\(.*\)on$/\1  off/' -e 's/^no\(.*\)off$/\1  on/'
}

## ffmpegによるgif化
function gifize(){
  ffmpeg -i $1 -vf scale=$2:-1 -r 5 $1.gif
}

# Golang
export GOPATH=$HOME/dev
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
# 以下は必須ではないが
export MYGITHUB=$GOPATH/src/github.com/ryotako

# added by Anaconda3 4.1.1 installer
export PATH="//anaconda/bin:$PATH"

# loacl setting {{{
if [ -f ~/.zshrc_local ];then
  source ~/.zshrc_local
fi

# Modeline {{{1
# vim:set foldmethod=marker:
