# 基本設定 {{{1

# homebrewで入れた関係で必要
# zsh
unalias  run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help
# エディタ
export EDITOR=vim

# プロンプト
PROMPT='%K{blue}%F{black}%~%f%k '
RPROMPT='[%w%t]'

# 今から始めるzsh {{{2
### 言語
export LANG=ja_JP.UTF-8
### 自動補完
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
### 移動履歴
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
### ヒストリ
HISTFILE=~/.zsh_history
HISTFIZE=1000000
SAVEHIST=1000000
setopt share_history
setopt hist_ignore_all_dups
alias history-all='history -n 1'
### その他
setopt no_beep
# setopt correct

# プラグイン {{{1
fpath=(/usr/local/share/zsh-completions $fpath)


# エイリアス {{{1
## デフォルトオプションの設定
alias ls='ls -G'

## 短縮表記
alias a=alias , c=clear , q=exit , t=type , w=which
alias vi=vim

## 独自コマンド 
alias relogin='exec $SHELL -l'

## 設定ファイルへのアクセス
alias ,b='vim ~/.bashrc'
alias ,g='vim ~/.gitconfig'
alias ,p='vim ~/.config/peco/config.json'
alias ,v='vim ~/.vimrc'
alias ,v='vim ~/.vimrc'
alias ,z='vim ~/.zshrc && source ~/.zshrc'

# ツールの補助 
alias dotfiles='cd ~/Dropbox/dotfiles/'
alias igor='cd ~/Dropbox/Igor\ Pro\ User\ Files/User\ Procedures/'
alias blockdiag='blockdiag --antialias'
## ffmpegによるgif化
function gifize(){
  ffmpeg -i $1 -vf scale=$2:-1 -r 5 $1.gif
}

function brew_info(){
  brew info $(brew list | peco)
}

# added by Anaconda3 4.1.1 installer
export PATH="//anaconda/bin:$PATH"

# Modeline {{{1
# vim:set foldmethod=marker:
