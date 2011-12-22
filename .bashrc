#paths
export PATH=${PATH}:/usr/local/bin
export PATH="~/bin:$PATH"

#MacPorts Installer addition on 2011-09-13_at_10:10:44: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# bash_completion for git
if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

export TERM='xterm-color'
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

export PS1='\[\e[1;36m\]\u\[\e[0m\]:\W\[\e[1;31m\]$(__git_ps1 "(%s)")\[\e[0m\] \[\e[1;36m\]$\[\e[0m\] '
