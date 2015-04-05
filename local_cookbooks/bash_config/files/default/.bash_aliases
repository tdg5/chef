function bcd() {
  cd $(bundle show $1)
}

function bg() {
  grep -R -- "$1" $(bundle list --paths)
}

function cd_src() {
  cd ~/src/$1
}

function chef() {
  [ ! -z $1 ] && name="$1" || name=`hostname`
  rvmsudo chef-solo -c ~/src/tdg5_chef/solo/solo.rb -j ~/src/tdg5_chef/solo/nodes/${name}.json
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
  [ ! -z $1 ] && n="$1" || n="2"
  for pic in $(find -maxdepth 1 -name 'DSC_*.JPG' -o -name 'DSC_*.jpg' -o -name 'DSC_*.NEF' | sed 's/.\/DSC_//'); do mv DSC_${pic} DSC_${n}${pic}; done
}

function rm_nefs_without_jpgs() {
  for x in $(comm -13 <(find -name '*.JPG'| sed 's/JPG/NEF/' | sort) <(find -name '*.NEF' | sort)); do rm -v $x; done
}

function raw2jpg() {
  mkdir -p raw
  for pic in $(find -maxdepth 1 -name '*.NEF'); do mv ${pic} raw; done
  ufraw-batch --out-type=jpeg --out-path=./ ./raw/*.NEF
}

# Display commit differences between two branches
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

# Return to previous branch
function gbrb() {
  br="$(git reflog | sed -n 's/.*checkout: moving from .* to \(.*\)/\1/p' | sed "2q;d")"
  git checkout $br
}

# Rebase from previous branch
function grbp() {
  br="$(git reflog | sed -n 's/.*checkout: moving from .* to \(.*\)/\1/p' | sed "2q;d")"
  git rebase $br
}

# Merge previous branch
function gmp() {
  br="$(git reflog | sed -n 's/.*checkout: moving from .* to \(.*\)/\1/p' | sed "2q;d")"
  git merge $br
}

# Push to origin remote setting upstream branch appropriately
function gputu() {
  if [ -z $1 ]; then
    br="$(git rev-parse --abbrev-ref HEAD)"
  else
    br="$1"
  fi
  git push -u origin $br
}

# Checkout pull request ref by PR id
function gcopr() {
  ([ -z "$1" ] || [ $(($1)) -le 0 ]) && echo 'Invalid pull request ID' && return
  pr_id=$1
  [ -z "$2" ] && br_name="pull_request_${1}" || br_name="$2"
  git fetch origin pull/${pr_id}/head:${br_name}
  git checkout ${br_name}
}

function gghist() {
  git rev-list --all | xargs git grep "$@"
}

function ggio() {
  $EDITOR $(git grep -i --name-only "$@")
}

function ggo() {
  $EDITOR $(git grep --name-only "$@")
}

GBRR_DEFAULT_COUNT=10
function gbrr() {

  COUNT=${1-$GBRR_DEFAULT_COUNT}

  IFS=$'\r\n' BRANCHES=($(
      git reflog | \
      sed -n 's/.*checkout: moving from .* to \(.*\)/\1/p' | \
      perl -ne 'print unless $a{$_}++' | \
      head -n $COUNT
  ))

  for ((i = 0; i < ${#BRANCHES[@]}; i++)); do
      echo "$i) ${BRANCHES[$i]}"
  done

  read -p "Switch to which branch? "
  if [[ $REPLY != "" ]] && [[ ${BRANCHES[$REPLY]} != "" ]]; then
      echo
      git checkout ${BRANCHES[$REPLY]}
  else
      echo Aborted.
  fi
}

function gtaga() {
  [ -z "$1" ] && echo 'Invalid tag name!' && return
  [ -z "$2" ] && msg="$1" || msg="$2"
  git tag -a $1 -m $msg
}

function gtagdr() {
  [ -z "$1" ] && echo 'Invalid tag name!' && return
  git push origin :refs/tags/$1
}

function gshn() {
  ([ -z "$1" ] || [ $(($1)) -le 0 ]) && echo 'Invalid integer!' && return
  git show $(echo "HEAD@{$1}")
}

alias aliases='vi ~/.bash_aliases'
alias be='bundle exec'
alias bun='bundle'
alias c='cd'
alias cd-='cd -'
alias cd.='cd .'
alias cd..='cd ..'
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gai='git add --interactive'
alias gamd='git commit --amend --no-edit'
alias gamend='git commit --amend'
alias gap='git add -p'
alias gau='git add -u'
alias gback='git reset HEAD~ --soft'
alias gbackk='git reset HEAD~ --hard'
alias gbr='git branch'
alias gbrc='git rev-parse --abbrev-ref HEAD'
alias gbrp='git reflog | sed -n "s/.*checkout: moving from .* to \(.*\)/\1/p" | sed "2q;d")'
alias gbrt="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
alias gcl='git clone'
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
alias ggno='git grep --name-only'
alias gget='git pull'
alias gl='git log'
alias glp='git log -p'
alias glv='git log --oneline --graph'
alias gm='git merge'
alias gma='git merge --abort'
alias gmm='git merge master'
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
alias gstd='git stash drop'
alias gtagd="git tag -d"
alias gtagl="git tag -l"
alias gtagp="git push --tags"
alias gundo='git reset HEAD@{1}'
alias ll='ls -altr'
alias my_ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias pride="REPORTER=pride guard"
alias realias='source ~/.bash_aliases'
alias syslog='tail -f /var/log/syslog'
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
__git_complete gap _git_add
__git_complete gau _git_add
__git_complete gback _git_reset
__git_complete gbr _git_branch
__git_complete gco _git_checkout
__git_complete gcp _git_cherry_pick
__git_complete gd _git_diff
__git_complete gg _git_grep
__git_complete ggi _git_grep
__git_complete ggno _git_grep
__git_complete gget _git_pull
__git_complete gl _git_log
__git_complete glv _git_log
__git_complete glp _git_log
__git_complete gput _git_push
__git_complete grb _git_rebase
__git_complete gs _git_status
__git_complete gsh _git_show
__git_complete gst _git_stash
__git_complete gundo _git_reset
