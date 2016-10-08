# プラグイン {{{1
fpath=(/usr/local/share/zsh-completions $fpath) # zsh-completions
source $(brew --prefix)/etc/profile.d/z.sh      # z

# 基本設定 {{{1
## ヘルプ (homebrewでzshを入れた関係で必要)
unalias run-help 
autoload run-help
HELPDIR=/usr/local/share/zsh/help

## エディタ，ページャ
export EDITOR=vim PAGER=vimpager
export LANG=ja_JP.UTF-8

## プロンプト
PROMPT='%K{blue}%F{black}%.%f%k '
RPROMPT='[%w %t]'

## ヒストリ
HISTFILE=~/.zsh_history
HISTFIZE=1000000
SAVEHIST=1000000

## 自動補完
autoload -Uz compinit && compinit
zstyle ':completion:*:default' menu select=2 # 現在の選択肢を反転表示
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 大文字小文字無視

## オプション
setopt auto_cd auto_pushd pushd_ignore_dups # ディレクトリ変更
setopt list_rows_first menu_complete # 補完
setopt equals # ファイル名展開とグロブ
setopt share_history hist_ignore_all_dups hist_reduce_blanks # ヒストリ
setopt no_flow_control # 入出力
setopt no_beep emacs # コマンドライン編集

## モジュール
# zmodload zsh/mathfunc

## キーバインド
bindkey ^P history-beginning-search-backward
bindkey ^N history-beginning-search-forward

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
## 移動系
alias -g ...='../..'
alias -g ....='../../..'
## フィルタ系
alias -g F='|fzf'
alias -g G='|egrep'
alias -g P='|peco'
## 閲覧系
alias -g H='--help' # 簡易ヘルプ
alias -g V='|vimpager'
alias -g Q="&& echo y || echo n" # Question, 終了コード判定
## 出力抑制系
alias -g _="1>/dev/null"  # エラーが読みたいとき
alias -g __="2>/dev/null" # エラーがいらないとき
alias -g ___="1>/dev/null 2>/dev/null" # サイレント

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

# パス関連 {{{1

# 自作スクリプトの場所
export BINPATH="$HOME/bin"
export PATH="$BINPATH:$PATH"

# Homebrew
export PATH="/usr/local/bin:$PATH"

# Igor Pro
export IGORPATH="$HOME/Dropbox/Igor Pro User Files"

# Golang
export GOPATH="$HOME/dev"
export PATH="$GOPATH/bin:$PATH"

# added by Anaconda3 4.1.1 installer
export PATH="/anaconda/bin:$PATH"

# loacl setting {{{1
if [ -f ~/.zshrc_local ];then
  source ~/.zshrc_local
fi

# vim:set foldmethod=marker:
typeset -U name_of_the_variable
