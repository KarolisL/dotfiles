# load zgen
source "${HOME}/dev/dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/gnu-utils
    zgen load zsh-users/zsh-syntax-highlighting
#    zgen load marzocchi/zsh-notify
    zgen load sorin-ionescu/prezto modules/git/alias.zsh
    zgen load lesaint/lesaint-mvn

    # completions
    zgen load zsh-users/zsh-completions src
    zgen load akoenig/gulp-autocompletion-zsh

    # theme
    #zgen load sindresorhus/pure 
    #zgen load fdv/platypus platypus.zsh-theme
#    zgen oh-my-zsh themes/arrow
    #zgen oh-my-zsh themes/peepcode
    #zgen oh-my-zsh themes/blinks
    zgen oh-my-zsh themes/mortalscumbag

    # Git
    zgen load djui/alias-tips

#    zgen load RobSis/zsh-completion-generator

    # save all to init script
    zgen save
fi

# Add gnue coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Add postgresql
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin


## Exports
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "
#export M2_HOME="/usr/share/maven/"
#export M2_HOME="/usr/local/Cellar/maven/3.3.3"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home"
export M2_HOME=/usr/local/Cellar/maven/3.3.3/libexec/


export EDITOR="vim"

source ~/bin/Apps/z/z.sh

#source ~/.bash_aliases


expand-aliases() {
    unset 'functions[_expand-aliases]'
    functions[_expand-aliases]=$BUFFER
    (($+functions[_expand-aliases])) &&
        BUFFER=${functions[_expand-aliases]#$'\t'} &&
        CURSOR=$#BUFFER
}

zle -N expand-aliases
bindkey '\e^E' expand-aliases

# Disable shared history
unsetopt share_history


#### Custom Fn
function stopwatch() {
date1=`date +%s`; 
while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
done
}

### OpenShift
#export KUBERNETES_DOMAIN=vagrant.f8
#export DOCKER_HOST=tcp://vagrant.f8:2375

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# forward/backward
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

##### Aliases #######
alias ls="ls --color=auto"
