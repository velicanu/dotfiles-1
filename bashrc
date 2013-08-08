#.bashrc

# If the local folder 'bin' exists put it in my path
[ -d ~/bin ] && export PATH="$PATH:~/bin"

# source the split files
source ~/.dotfiles/git_bash
source ~/.dotfiles/work_bash
source ~/.dotfiles/home_bash

# Use emacs for editor
export EDITOR=emacs
export VISUAL=emacs

# PS1
##################################################
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1="\[\033[01;32m\]\h\
\[\033[00;35m\]$(get_CMSSW_version)\
\[\033[01;34m\] \W \
\[\033[00;35m\]$(get_git_info)\
\[\033[01;34m\]\$\[\033[00m\] "
fi

# utility aliases, color
######################################################
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

alias la='ls -Ah'
alias ll='ls -lh'

alias em='emacs'
alias emn='emacs -nw'

