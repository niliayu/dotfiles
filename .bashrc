
# Make solarized colors work
if [[ -n ${TMUX} ]]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi


# User aliases
alias ls="ls -G"
alias ll="ls -alF -G"
alias la="ls -A -G"
alias l="ls -CF -G"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias pip="python3 -m pip"

# For git
alias squashnewcommit="git commit -m \"tmp\" && git rebase -i HEAD~2"
alias rebasemaster="git checkout master && git pull && git checkout - && git rebase master"
