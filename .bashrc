
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
    ssh -A -t "$1" "cat > /tmp/tmux-remote.conf <<'EOF'
set-option -g default-shell /bin/bash
set-option -g default-terminal \"screen-256color\"
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
bind-key v copy-mode
bind-key p paste-buffer
set-option -g update-environment \"SSH_AUTH_SOCK SSH_CONNECTION DISPLAY\"
setenv -g SSH_AUTH_SOCK \$SSH_AUTH_SOCK
EOF
tmux -f /tmp/tmux-remote.conf attach || tmux -f /tmp/tmux-remote.conf new"
}
