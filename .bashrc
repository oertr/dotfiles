# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source ~/bin/z.sh
source ~/bin/git-prompt.sh

### Aliases
alias ..='cd ..'
alias grep='grep --color'
alias path='echo -e ${PATH//:/\\n}'
alias reload='exec ${SHELL} -l'
alias server='sudo python3 -m http.server 80'
alias tree='tree --dirsfirst -I "node_modules|.git" -Ca'
alias cp='cp -i'
alias mv='mv -i'
alias p='less'
alias l='ls -AFlhG --color=auto --group-directories-first'
alias v='vim'

### Command
cheat (){
  curl -s "https://cheat.sh/$1" | less
}
mcd (){
  mkdir $1
  cd $1
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
    if [ $(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ]; then
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

reset="\[\e[0m\]";
bold='\[\e[1m\]';
red="\[\e[1;31m\]";
green="\[\e[1;32m\]";
blue="\[\e[1;34m\]";
white="\[\e[1;37m\]";
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true

PS1="$bold$green\u(${machine})@\h$white:$blue\w"
PS1+="\$(__git_ps1 \"$reset($red%s$reset) \")"
PS1+="$reset\\$ "
export PS1

unset machine reset bold red green blue white

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
