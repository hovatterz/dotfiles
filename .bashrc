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
alias lla='ls -lGa'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

DULL=0
BRIGHT=1
FG_RED=31
FG_GREEN=32
FG_BLUE=34
NORMAL="\[\e[0m\]"
RED="\[\e[${DULL};${FG_RED}m\]"
BRIGHT_RED="\[\e[${BRIGHT};${FG_RED}m\]"
GREEN="\[\e[${DULL};${FG_GREEN}m\]"
BRIGHT_GREEN="\[\e[${BRIGHT};${FG_GREEN}m\]"
BLUE="\[\e[${DULL};${FG_BLUE}m\]"
BRIGHT_BLUE="\[\e[${BRIGHT};${FG_BLUE}m\]"

grb_git_prompt() {
	local g="$(__gitdir)"
	if [ -n "$g" ]; then
		local GIT_PROMPT=`__git_ps1 "(%s)"`
		echo ${GIT_PROMPT}
	fi
}

export PS1="${BRIGHT_GREEN}\u${NORMAL}:\W${BRIGHT_GREEN}\$(grb_git_prompt)${NORMAL} $ "
