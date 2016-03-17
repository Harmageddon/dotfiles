# Change to the directory of this file
MY_DIR=$(dirname $BASH_SOURCE)
CALLED_FROM=$PWD

if [ $MY_DIR ]; then
    cd $MY_DIR
fi

# Bash aliases
if [ -f .bash_aliases ]; then
    source .bash_aliases
fi

#### Git integration ####
# see: https://git-scm.com/book/en/v2/Git-in-Other-Environments-Git-in-Bash

## Download git-completion.bash and git-prompt.sh if not existing ##
if [ ! -f ~/git-completion.bash ]; then
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/git-completion.bash
fi

if [ ! -f ~/git-prompt.sh ]; then
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/git-prompt.sh
fi

source ~/git-completion.bash
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"

#### Colors ####
export TERM_FG_NONE="\[\033[0m\]"
export TERM_FG_BLACK="\[\033[0;30m\]"
export TERM_FG_RED="\[\033[0;31m\]"
export TERM_FG_GREEN="\[\033[0;32m\]"
export TERM_FG_YELLOW="\[\033[0;33m\]"
export TERM_FG_BLUE="\[\033[0;34m\]"
export TERM_FG_PURPLE="\[\033[0;35m\]"
export TERM_FG_CYAN="\[\033[0;36m\]"
export TERM_FG_GRAY="\[\033[0;37m\]"

## Options for prompt coloring to set in ~/.rcsettings.sh
# Contents:
# COLOR_USER=$TERM_FG_? (one of the above colors. Color for the user name, defaults to none)
# COLOR_HOST=$TERM_FG_? (one of the above colors, Color for the host name, defaults to none)
# COLOR_ROOT=$TERM_FG_? (one of the above colors. Color for the user name if bash is run as root, defaults to red)

if [ -f ~/.rcsettings.sh ]; then
  source ~/.rcsettings.sh
fi

if [ -z $COLOR_USER ]; then
  COLOR_USER=$TERM_FG_NONE
fi
if [ -z $COLOR_ROOT ]; then
  COLOR_ROOT=$TERM_FG_RED
fi
if [ -z $COLOR_HOST ]; then
  COLOR_HOST=$TERM_FG_NONE
fi

if [ $USER = "root" ]; then
  COLOR_USER=$COLOR_ROOT
fi

#### Custom prompt ####
PS1=${COLOR_USER}'\u'${TERM_FG_NONE}
if [ -z $HIDE_HOST ] || [ $HIDE_HOST -ne 1 ]; then
  PS1=$PS1$TERM_FG_GRAY'@'${COLOR_HOST}'\h'${TERM_FG_NONE}
fi
PS1=$PS1':\w\
'${TERM_FG_BLUE}'$(__git_ps1 " (%s)")'${TERM_FG_NONE}'\
\$ '

# My job here is done, cd back to the directory where I was called from.
cd $CALLED_FROM

