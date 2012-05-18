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
alias bx='bundle exec'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

source ~/dotfiles/bash_colors.sh

GIT_PS1_SHOWDIRTYSTATE=yes
function grb_git_prompt() {
	local g="$(__gitdir)"
	if [ -n "$g" ]; then
        local GIT_PROMPT=`__git_ps1 " on ${BRIGHT_GREEN}(%s)${NORMAL}"`
		echo "${GIT_PROMPT}"
	fi
}

export PS1="${RED}\u${NORMAL} at ${BLUE}\h${NORMAL} in ${YELLOW}\w${NORMAL}\$(grb_git_prompt)\n$ "

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
