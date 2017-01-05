# load zgen
source "${HOME}/.zgen-src/zgen.zsh"

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
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/docker-compose
    zgen oh-my-zsh plugins/mvn
    zgen oh-my-zsh plugins/gradle
    zgen oh-my-zsh plugins/aws
    zgen oh-my-zsh plugins/gpg-agent
    zgen oh-my-zsh plugins/terraform


    zgen load zsh-users/zsh-syntax-highlighting
    zgen load sorin-ionescu/prezto modules/git/alias.zsh

    # completions
    zgen load zsh-users/zsh-completions src
    zgen load akoenig/gulp-autocompletion-zsh

    # theme
    zgen load denysdovhan/spaceship-zsh-theme spaceship

    # Git
    zgen load djui/alias-tips

    zgen load RobSis/zsh-completion-generator zsh-completion-generator.plugin.zsh
    compinit

    # save all to init script
    zgen save
fi

## Spaceship theme
SPACESHIP_NVM_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_VI_MODE_SHOW=true
# Number of folders to truncate of cwd (0=disabled)
SPACESHIP_PROMPT_TRUNC=0
SPACESHIP_PROMPT_SYMBOL="$"

# Add gnue coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Add postgresql
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
# Home/bin
export PATH="$PATH:$HOME/bin"
# Save history after command rather than after shell exit
setopt INC_APPEND_HISTORY


## Exports
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "
export M2_HOME=/usr/local/Cellar/maven/3.3.9/libexec/
export GROOVY_HOME=/usr/local/opt/groovy/libexec
#export JAVA_CMD=$(which drip)
#export JAVACMD=$(which drip)
export GPG_TTY=`tty`

export LC_ALL="en_US.UTF-8"


export EDITOR="vim"


zstyle :omz:plugins:ssh-agent agent-forwarding on

### Includes
# Load autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# Load 'z'
source ~/bin/z.sh 
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

# Rbenv
eval "$(rbenv init -)"

# Golang
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
