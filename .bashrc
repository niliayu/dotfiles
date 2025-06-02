
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

# alias pip="/opt/homebrew/bin/pip3.8"
# alias python="/opt/homebrew/bin/python3.8"
# alias pip3="/opt/homebrew/bin/pip3.8"
# alias python3="/opt/homebrew/bin/python3.8"


# For git
alias squashnewcommit="git commit -m \"tmp\" && git rebase -i HEAD~2"
alias rebasemain="git checkout main && git pull && git checkout - && git rebase main"
alias newbranch="git checkout main && git pull && git checkout -b"
alias newbranch_main="git checkout main && git pull && git checkout -b"
alias pipinstalle="pip install -e . --trusted-host infra-pypicloud.prod.pachama.com --index-url https://infra-pypicloud.prod.pachama.com/simple/"

alias rg="rg --hidden -g '!{.git/*}'"

export GOOGLE_APPLICATION_CREDENTIALS="/Users/ailinyu/repos/labs/secrets/gcloud.json"
export DOCKER_BUILDKIT=1

# Run VSCode with no proxy server, which I need for extensions to work sometimes for some reason
alias code_no_proxy="code --no-proxy-server"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ailinyu/y/google-cloud-sdk/path.bash.inc' ]; then . '/Users/ailinyu/y/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ailinyu/y/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/ailinyu/y/google-cloud-sdk/completion.bash.inc'; fi

# eval "$(thefuck --alias)"

# Enable kube autocompletion
# source <(kubectl completion bash)

export GOPATH=$(go env GOPATH)
export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin

#export FLYTE_ADMIN_ENDPOINT="dns:///flyte.labs.pachama.com"
#export FLYTE_PROJECT="project-evaluation"
#export FLYTE_DOMAIN="development"

mkdir -p ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"


. "$HOME/.cargo/env"
