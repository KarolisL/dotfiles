# load zgen
source "${HOME}/dev/dotfiles/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/gnu-utils
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load sorin-ionescu/prezto modules/git/alias.zsh
    zgen load lesaint/lesaint-mvn

    # completions
    zgen load zsh-users/zsh-completions src
    zgen load akoenig/gulp-autocompletion-zsh

    # theme
    zgen oh-my-zsh themes/mortalscumbag

    # Git
    zgen load djui/alias-tips

    zgen load RobSis/zsh-completion-generator

    # save all to init script
    zgen save
fi

# Add gnue coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Add postgresql
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
# Home/bin
export PATH="$PATH:$HOME/bin"


## Exports
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "
export M2_HOME=/usr/local/Cellar/maven/3.3.3/libexec/
export BYOBU_PREFIX=$(brew --prefix)


export EDITOR="vim"

### Includes
source ~/bin/Apps/z/z.sh
source ~/.aliases
source ${HOME}/dev/dotfiles/sudo.zsh

# Disable shared history
unsetopt share_history

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# forward/backward
#bindkey -e
#bindkey '^[^[[D' forward-word
#bindkey '^[^[[C' backward-word

