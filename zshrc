[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

if [ -e /Users/jwilcox/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jwilcox/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# three directories up of context %2 for two
PROMPT='%3~: '

HISTSIZE=99999
HISTFILESIZE=99999
SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

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
        cd /Users/jwilcox/src/github.com/Shopify
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

