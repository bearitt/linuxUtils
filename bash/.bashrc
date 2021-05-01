#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LC_ALL=C
export TTY=$(tty)
export GPG_TTY=$TTY

# Shell options
shopt -s autocd
shopt -s cdspell
shopt -s complete_fullquote
shopt -s direxpand
shopt -s dirspell
shopt -s expand_aliases
shopt -s extglob
shopt -s extquote
shopt -s force_fignore
shopt -s globstar
shopt -s histappend
shopt -s hostcomplete
shopt -s interactive_comments
shopt -s nocasematch
shopt -s progcomp
shopt -s promptvars
shopt -s sourcepath
shopt -s xpg_echo

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:pwd:exit:cd .."

# append to the history file, don't overwrite it
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Store multiline commands as one line.
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

shopt -s checkwinsize

set -o interactive-comments -o monitor -o hashall -o braceexpand -o emacs

# enable bash completion.
if [ -a /usr/share/bash-completion/bash_completion ]; then
	source /usr/share/bash-completion/bash_completion
fi

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*|xfce4*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

ulimit -S -c 0          # disable core dumps
stty -ctlecho           # turn off control character echoing

# Add custom enviroment
. $HOME/.bash/.path
. $HOME/.bash/.export
. $HOME/.bash/.func
. $HOME/.bash/.alias
. $HOME/.bash/.colors
#. $HOME/.bash/.prompt

if [ "$TERM" != "linux" ]; then
    source ~/.pureline/pureline ~/.pureline.conf
fi

#neofetch --ascii_distro arch
alsi -l

# syntax: ssHash

PATH="/home/bearitt/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/bearitt/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/bearitt/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/bearitt/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/bearitt/perl5"; export PERL_MM_OPT;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bearitt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bearitt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bearitt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bearitt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Fucked up alias
eval "$(thefuck --alias)"
