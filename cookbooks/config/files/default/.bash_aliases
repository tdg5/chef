function chef() {
  rvmsudo chef-solo -c ~/src/tdg5_chef/solo/solo.rb -j ~/src/tdg5_chef/solo/nodes/$1.json
}

function gimprand() {
  x=''
  [ ! -z $1 ] && n="$1" || n="5"
  maybe_path='/home/tdg5/Pictures/maybes'
  for img in $(ls -al $maybe_path | grep -i jpg | sort -R | head -n $n | awk '{print "'$maybe_path/'"$9}'); do x="$x $img"; done; gimp $x
}

function top_cmds() {
  [ ! -z $1 ] && n="$1" || n="10"
  history | awk '{a[$2 " " $3]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -n $n
}

alias aliases='vi ~/.bash_aliases'
alias be='bundle exec'
alias bun='bundle'
alias c='cd'
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gback='git reset HEAD~ --soft'
alias gamd='git commit --amend --no-edit'
alias gamend='git commit --amend'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias gg='git grep'
alias ggi='git grep -i'
alias gget='git pull'
alias gl='git log'
alias gput='git push'
alias grh='git reset HEAD'
alias gs='git status'
alias gstash='git stash'
alias gsh='git show'
alias gss='git stash save'
alias ll='ls -altr'
alias realias='source ~/.bash_aliases'
alias up='[ $(git rev-parse --show-toplevel 2>/dev/null || echo ~) = $(pwd) ] && cd $([ $(echo ~) = $(pwd) ] && echo / || echo) || cd $(git rev-parse --show-toplevel 2>/dev/null)'

# enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto -n'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
