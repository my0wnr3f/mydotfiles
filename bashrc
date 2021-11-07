[[ $- != *i* ]] && return

blk='\[\033[01;30m\]'   
red='\[\033[01;31m\]'   
grn='\[\033[01;32m\]'   
ylw='\[\033[01;33m\]'   
blu='\[\033[01;34m\]'   
pur='\[\033[01;35m\]'   
cyn='\[\033[01;36m\]'   
wht='\[\033[01;37m\]'   
clr='\[\033[00m\]'      

EDITOR='vim'
set -o vi

alias ..='cd .. ; pwd'

alias ...='cd ../.. ; pwd'

alias ....='cd ../../.. ; pwd'

alias ls='ls --color=auto'

alias ll='ls -l'
alias la='ls -a'

alias mkscr='maim --select | xclip -selection clipboard -target image/png'

alias scheme='scheme --eehistory off'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

complete -F _complete_alias config

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1=''${pur}' \W'${grn}' \$ '${clr}''

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

export LESSHISTFILE="-"
export GTK2_RC_FILES="/home/l1l0/.config/gtk-2.0/gtkrc-2.0"
export HOME="/home/l1l0"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export HISTFILE="$XDG_CONFIG_HOME/bash_history"
