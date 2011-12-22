
# MacPorts Installer addition on 2011-09-13_at_10:10:44: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/Users/zack/pear/bin:$PATH
export PATH=/Users/zack/bin:$PATH
export PATH=/Applications/MAMP/bin/php/php5.3.6/bin:$PATH

if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

export CLICOLOR=1
export PS1='\[\e[1;36m\]\u\[\e[0m\]:\W\[\e[1;31m\]$(__git_ps1 "(%s)")\[\e[0m\] \[\e[1;36m\]$\[\e[0m\] '
