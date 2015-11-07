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
    zgen oh-my-zsh plugins/tmuxinator
    zgen oh-my-zsh plugins/boot2docker
    zgen oh-my-zsh plugins/mvn
    zgen oh-my-zsh plugins/gradle
    zgen oh-my-zsh plugins/ssh-agent

    zgen load zsh-users/zsh-syntax-highlighting
    zgen load sorin-ionescu/prezto modules/git/alias.zsh

    # completions
    zgen load zsh-users/zsh-completions src
    zgen load akoenig/gulp-autocompletion-zsh

    # theme
    zgen oh-my-zsh themes/mortalscumbag

    # Git
    zgen load djui/alias-tips

    zgen load RobSis/zsh-completion-generator zsh-completion-generator.plugin.zsh
    compinit

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
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export JAVA_CMD=$(which drip)
export JAVACMD=$(which drip)


export EDITOR="vim"


zstyle :omz:plugins:ssh-agent agent-forwarding on

### Includes
#source ~/bin/Apps/z/z.sh
source ~/.aliases
for f in ${HOME}/dev/dotfiles/shell-extra/*; do
    source "$f"
done

# Disable shared history
unsetopt share_history

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# forward/backward
#bindkey -e
#bindkey '^[^[[D' forward-word
#bindkey '^[^[[C' backward-word


test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
