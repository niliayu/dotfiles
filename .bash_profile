# Format command line
# export PS1='\u@\H:\w$ '
# With colors
export PS1='\033[36m\u\033[m@\033[32m\H:\033[35m\w\033[37m$ '

# Run git completion
if [ -f ~/.git-completion.bash ]; then
	  . ~/.git-completion.bash
fi

# Source bashrc
source ~/.bashrc

