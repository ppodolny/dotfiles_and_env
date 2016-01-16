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
alias ll='ls -la'
alias fuck='sudo $(history -p !!)'
alias whatismyip='curl http://ifconfig.me'
alias vpn_up='nmcli con up'
alias vpn_down='nmcli con down'
alias git-clean='git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch -d'
alias git-fast-add='git status| grep modified| awk -F: '{print $NF}'|xargs git add'


#Git shell customizations
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


#Change tab name according to ssh session

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

TITLEBAR='\[\e]0;\u@\h\a\]'
# Same thing.. but with octal ASCII escape chars
#TITLEBAR='\[\033]2;\u@\h\007\]'

if [ "$color_prompt" = yes ]; then
    PS1="${TITLEBAR}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "
else
    PS1="${TITLEBAR}\u@\h:\W\$ "
fi
unset color_prompt force_color_prompt


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
