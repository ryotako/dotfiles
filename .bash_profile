cmproot="/usr/local/etc/"
bashcmp+=("${cmproot}bash_completion")
bashcmp+=("${cmproot}bash_completion.d/git-prompt.sh")
bashcmp+=("${cmproot}bash_completion.d/git-completion.bash")
for ((i = 0; i < ${#bashcmp[@]}; i++)) {
  cmpfile="${bashcmp[$i]}"
  if [ -f "$cmpfile" ]; then
    source "$cmpfile"
  fi
}

if [ -f ~/.bashrc ];then
  source ~/.bashrc
fi

# added by Anaconda3 4.1.1 installer
export PATH="//anaconda/bin:$PATH"

# gaussian
export g16root=/Applications
. $g16root/g16/bsd/g16.profile
