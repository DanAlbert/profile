export editor=vim
export SVN_EDITOR=vim

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

PATH=$HOME/bin:$PATH
export PATH

PYTHONPATH=~/.local/lib/python2.6:$PYTHONPATH
export PYTHONPATH

if [ -f ~/.bash_profile_local ]; then
    . ~/.bash_profile_local
fi

# no more giant tabs
tabs -4

alias ls="ls --color=always"
alias git=hub
