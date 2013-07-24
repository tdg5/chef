alias c='cd'
alias gs='git status'
alias top10='history | awk '"'"'{a[$2 " " $3]++}END{for(i in a){print a[i] " " i}}'"'"' | sort -rn | head'
alias up='[ $(git rev-parse --show-toplevel 2>/dev/null || echo ~) = $(pwd) ] && cd $([ $(echo ~) = $(pwd) ] && echo / || echo) || cd $(git rev-parse --show-toplevel 2>/dev/null)'
