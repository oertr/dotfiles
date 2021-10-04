# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source ~/bin/z.sh
source ~/bin/git-prompt.sh

### Aliases
alias ..='cd ..'
alias grep='grep --color'
alias l='ls -AFlh --color=auto --group-directories-first'
alias path='echo -e ${PATH//:/\\n}'
alias reload='exec ${SHELL} -l'
alias server='sudo python3 -m http.server 80'
alias tree='tree --dirsfirst -I node_modules'
alias v='vim'
alias cp='cp -i'
alias mv='mv -i'

### Command
cheat (){
  curl "https://cheat.sh/$1"
}

### Config
HISTCONTROL=erasedups
HISTSIZE=3000
HISTFILESIZE=1000000
shopt -s histappend
shopt -s checkwinsize
shopt -s nocaseglob
shopt -s cdspell
shopt -s autocd
shopt -s globstar

### Prompt Colors
case $(uname -s) in
  Linux*)
    if grep -q Microsoft /proc/version; then
      machine=WSL
    else
      machine=Linux
    fi
    ;;
  Darwin*)    machine=MacOS;;
  CYGWIN*)    machine=Cygwin;;
  MINGW*)     machine=MinGW;;
  *)          machine=$(uname -s)
esac

if tput setaf 1 &> /dev/null; then
  tput sgr0; # reset colors
  reset="\[$(tput sgr0)\]";
  bold="\[$(tput bold)\]";
  # Solarized colors, taken from http://git.io/solarized-colors.
  black="\[$(tput setaf 0)\]";
  white="\[$(tput setaf 15)\]";
  blue="\[$(tput setaf 33)\]";
  cyan="\[$(tput setaf 37)\]";
  violet="\[$(tput setaf 61)\]";
  green="\[$(tput setaf 64)\]";
  red="\[$(tput setaf 124)\]";
  purple="\[$(tput setaf 125)\]";
  yellow="\[$(tput setaf 136)\]";
  orange="\[$(tput setaf 166)\]";
else
  reset="\[\e[0m\]";
  bold='\[\e[1m\]';
  black="\[\e[1;30m\]";
  red="\[\e[1;31m\]";
  green="\[\e[1;32m\]";
  orange="\[\e[1;33m\]";
  yellow="\[\e[1;33m\]";
  blue="\[\e[1;34m\]";
  purple="\[\e[1;35m\]";
  violet="\[\e[1;35m\]";
  cyan="\[\e[1;36m\]";
  white="\[\e[1;37m\]";
fi;

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

#PS1="\n"
PS1="$bold$green\u(${machine})@\h$white:$blue\w"
PS1+="\$(__git_ps1 \"$reset($red%s$reset) \")"
PS1+="$reset\$ "
export PS1

unset machine

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
