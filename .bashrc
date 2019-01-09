# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.myownrc
source ~/.git-completion.bash
export PATH=$PATH:/usr/local/vim/bin/
alias vi=vim
