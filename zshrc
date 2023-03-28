[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# added by Nix installer
if [ -e /Users/jwilcox/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jwilcox/.nix-profile/etc/profile.d/nix.sh; fi

# three directories up of context %2 for two
PROMPT='%3~: '

if [ "$SPIN" ]; then
	export HISTFILE=/home/spin/zsh_history
	export HISTSIZE=5000
	export SAVEHIST=9000

	setopt HIST_FIND_NO_DUPS
	setopt INC_APPEND_HISTORY
else
        HISTSIZE=99999
        HISTFILESIZE=99999
        SAVEHIST=$HISTSIZE
        setopt HIST_IGNORE_DUPS
        setopt HIST_IGNORE_SPACE
fi

alias h="history"
alias hgrep="history 1|grep"
alias cls="clear;ls"
alias cla="clear;ls -a"
alias c="clear"
alias ls="ls -Gp"
alias ll="ls -lAh"
alias cd..="cd .."
alias cd...="cd ../.."

bold=$(tput bold)
normal=$(tput sgr0)

function syu {
        cd $HOME/src/github.com/Shopify
        for di in *; do
        if [ -d $di ]; then
        cd $di;
        if [ -d .git ]; then
           printf "\n${bold}%s${normal}\n" `pwd`;
           git branch;
           echo;
           git pull;
        fi;
        cd ..;
        fi;
        done
}

