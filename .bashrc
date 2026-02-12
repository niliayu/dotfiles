
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

# For git
alias squashnewcommit="git commit -m \"tmp\" && git rebase -i HEAD~2"
alias rebasemain="git checkout main && git pull && git checkout - && git rebase main"
alias newbranch="git checkout main && git pull && git checkout -b"
alias newbranch_main="git checkout main && git pull && git checkout -b"
alias pipinstalle="pip install -e . --trusted-host infra-pypicloud.prod.pachama.com --index-url https://infra-pypicloud.prod.pachama.com/simple/"

alias rg="rg --hidden -g '!{.git/*}'"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

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
source <(kubectl completion bash)

# export GOPATH=$(go env GOPATH)
export PATH=/opt/homebrew/bin:$PATH
# export PATH=$PATH:$(go env GOPATH)/bin

# mkdir -p ~/.nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"
. "$HOME/.cargo/env"


rtmux() {
       local host="${@: -1}"  # Last argument is the host
       local ssh_opts="${@:1:$(($#-1))}"  # Everything else is SSH options
       ssh -A $ssh_opts "$host" "cat > /tmp/tmux-$$.conf && tmux -f /tmp/tmux-$$.conf attach || tmux -f /tmp/tmux-$$.conf new" < ~/.tmux.conf
   }
