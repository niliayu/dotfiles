# Format command line
# export PS1='\u@\H:\w$ '
# With colors
export PS1='\033[36m\u\033[m@\033[32m\H:\033[35m\w\033[37m$ '

# Run git completion
if [ -f ~/.git-completion.bash ]; then
	  . ~/.git-completion.bash
fi


# Share git credentials with docker
if [ -z "$SSH_AUTH_SOCK" ]; then
	# Check for a currently running instance of the agent
	RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
	if [ "$RUNNING_AGENT" = "0" ]; then
		# Launch a new instance of the agent
		ssh-agent -s &> $HOME/.ssh/ssh-agent
	fi
	eval `cat $HOME/.ssh/ssh-agent`
fi

echo "defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false"
echo "defaults delete -g ApplePressAndHoldEnabled  # If necessary, reset global default"

# Source bashrc
source ~/.bashrc



