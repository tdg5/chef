function bcd() {
  cd $(bundle show $1)
}

function cd_src() {
  cd ~/src/$1
}

function chef() {
  rvmsudo chef-solo -c ~/src/tdg5_chef/solo/solo.rb -j ~/src/tdg5_chef/solo/nodes/$1.json
}

function gimprand() {
  x=''
  [ ! -z $1 ] && n="$1" || n="5"
  maybe_path='/home/tdg5/Pictures/maybes'
  for img in $(ls -al $maybe_path | grep -i jpg | sort -R | head -n $n | sort -n | awk '{print "'$maybe_path/'"$9}'); do x="$x $img"; done; gimp $x
}

function top_cmds() {
  [ ! -z $1 ] && n="$1" || n="10"
  history | awk '{a[$2 " " $3]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head -n $n
}

function change_pic_offsets() {
  [ ! -z $1 ] && n="$1" || n="1"
  for pic in $(find -name 'DSC_*.JPG' | sed 's/.\/DSC_//'); do mv DSC_${pic} DSC_${n}${pic}; done
}

function gbrc() {
  git branch | awk '/\*/ { print $2 }'
}

function gbrd() {
  if [ ! -z $2 ]; then
    br1="$1"
    br2="$2"
  else
    br1="$(gbrc)"
    br2="$1"
  fi
  git rev-list --pretty=short $br1...$br2
}

function ggo() {
  vim $(git grep --name-only "$@")
}

alias aliases='vi ~/.bash_aliases'
alias be='bundle exec'
alias bun='bundle'
alias c='cd'
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gai='git add --interactive'
alias gap='git add -p'
alias gau='git add -u'
alias gback='git reset HEAD~ --soft'
alias gamd='git commit --amend --no-edit'
alias gamend='git commit --amend'
alias gbr='git branch'
alias gbrt="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gcoa='git checkout .'
alias gcob='git checkout -b'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gds='git diff --staged'
alias gg='git grep'
alias ggi='git grep -i'
alias gget='git pull'
alias gl='git log'
alias glv='git log --oneline --graph'
alias gput='git push'
alias gr='git reset'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbs='git rebase --skip'
alias grh='git reset HEAD'
alias gs='git status'
alias gsa='git stash apply'
alias gsh='git show'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gss='git stash save'
alias gssh='git stash show -p'
alias gst='git stash'
alias gundo='git reset HEAD@{1}'
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

# Bash completion
__git_complete ga _git_add
__git_complete gback _git_reset
__git_complete gbr _git_branch
__git_complete gco _git_checkout
__git_complete gcp _git_cherry_pick
__git_complete gd _git_diff
__git_complete gg _git_grep
__git_complete ggi _git_grep
__git_complete gget _git_pull
__git_complete gl _git_log
__git_complete glv _git_log
__git_complete gput _git_push
__git_complete grb _git_rebase
__git_complete gs _git_status
__git_complete gsh _git_show
__git_complete gst _git_stash
__git_complete gundo _git_reset
