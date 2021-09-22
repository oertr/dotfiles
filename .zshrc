export LANG=ja_JP.UTF-8
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz compinit
compinit

zstyle :compinstall filename '/home/ooe/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # �啶������������ʂ��Ȃ�
zstyle ':completion:*' list-colors ''

bindkey -e

setopt chase_links          # �����N�ֈړ�����Ƃ����ۂ̃f�B���N�g���ֈړ�
setopt hist_ignore_all_dups # �d������������ۑ����Ȃ�
setopt list_packed          # �⊮�����l�߂ĕ\��
setopt nolistbeep           # �r�[�v���I�t
setopt share_history        # ���������L
setopt prompt_subst

#�R�}���h��r���܂őł��Ă���AC-p, C-n�ň�v���闚��������
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


### PROMPT
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST}:${PWD}\007"
    }
    ;;
esac

function prompt()
{
    local GREEN="^[[32m"
    local YELLOW="^[[33m"
    local RESET="^[[0m"
    local DIM="^[[2m"

    # Git branch details
    function parse_git_branch() {
        local RED="^[[31m"
        local DIM="^[[2m"
        local RESET="^[[0m"
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/$DIM on $RESET$RED\1/"
    }
    PROMPT="$GREEN%n@%m$RESET$DIM in $RESET$YELLOW%~$RESET\$(parse_git_branch)$RESET
%(!.#.$)"
}
prompt

### Alias
alias grep='grep --color'
alias ls='ls -AFlh --color'
alias apt-cyg='apt-cyg -m http://ftp.jaist.ac.jp/pub/cygwin'
alias dp="cd 'C:\Documents and Settings\r.ooe\My Documents\Dropbox'"
alias ..="cd .."
alias ...="cd ../.."

### Misc
. ~/z.sh

