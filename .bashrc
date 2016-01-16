#Basic shell customizations
##############################

#Colors
export GREP_OPTIONS='--color=auto'
export LS_OPTS='--color=auto'
alias ls='ls ${LS_OPTS}'
alias less='less --RAW-CONTROL-CHARS'
export EDITOR='vim'

#History 
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:ignorespace
export HISTIGNORE="&"
export PATH=${PATH}:/opt/sublime:/usr/lib/git-core
source /etc/profile.d/bash_completion.sh
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo `date +%F\ \(%H:%M:%S\)` `pwd` $$ $USER "$(history 1)" >> ~/.bash_eternal_history'


#Aliases
#############
alias ll='ls -la'
alias fuck='sudo $(history -p !!)'
alias whatismyip='curl http://ifconfig.me'
alias vpn_up='nmcli con up'
alias vpn_down='nmcli con down'
alias git-clean='git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch -d'
alias git-fast-add='git status| grep modified| awk -F: '{print $NF}'|xargs git add'


#Git shell customizations
##############################
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /etc/bash_completion.d/git-completion.bash ]; then
    . /etc/bash_completion.d/git-completion.bash;
      export GIT_PS1_SHOWDIRTYSTATE=1
      export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\]( \w\[\033[01;33m\]\$(__git_ps1 ' %s')\[\033[01;34m\])$ \[\033[00m\]"
      export PS1="\[\033[G\]$PS1"
else
      export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\]( \w\[\033[01;33m\]\[\033[01;34m\])$ \[\033[00m\]"
fi


#SSH agent
eval `ssh-agent -s`
ssh-add ~/.ssh/*_rsa


#Devel. customizations
#################################
#python-env
export PYTHONPATH=$HOME/python/2.7.x/modules
export PYTHONSTARTUP=~/.pythonrc

#ruby-env
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"


#AWS customizations
###################################
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''
