#!/usr/bin/env bash

##### COLORS #####
# Color the hostname
# Light Blue
export HOST_COLOR="\[\033[1;36m\]"
# Blue
export HOST_COLOR="\[\033[1;34m\]"
# Bold Red
export HOST_COLOR="\[\033[1;31m\]"
# Light Purple
export HOST_COLOR="\[\033[1;35m\]"
# Green
export HOST_COLOR="\[\033[1;32m\]"
# Yellow
export WD_COLOR="\[\033[1;33m\]"
export BASH_COLOR="\[\033[1;33m\]"
# Bold Light gray
export DATE_COLOR="\[\033[1;37m\]"

export CMD_COLOR="\[\033[00m\]"
export VIM_COLOR="\[\033[00m\]"
export VIM_COLOR="\[\033[1;35m\]"

##### ROOT #####
# Color the colon red if root
export COLON_COLOR='0m'
if [ ${UID} -eq 0 ]; then
    export COLON_COLOR='1;31m'
fi

##### PS1 BEGIN #####
PS1="$DATE_COLOR<\D{%H:%M:%S}>$BASH_COLOR\s-\v-$VIM_COLOR${VIM##*/}$HOST_COLOR$(scutil --get LocalHostName)\[\033[00m\]\[\e[$COLON_COLOR\]:"

##### GIT PROMPT #####
git_prompt="${HOME}/.bash/prompt/git-prompt.bash"
if [ -f "${git_prompt}" ]; then
  export GIT_PS1_SHOWDIRTSTATE=1
  #export GIT_PS1_SHOWCOLORHINTS=1
  source "${git_prompt}"
  PS1="${PS1}$WD_COLOR["'\w$(__git_ps1 " (%s)")'"$WD_COLOR]"
else
  PS1="${PS1}$WD_COLOR[\w]"
fi
PS1="${PS1}\$$CMD_COLOR "

##### PS1 END #####

