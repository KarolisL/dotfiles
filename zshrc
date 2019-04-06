# load zgen
source "${HOME}/.zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/git-extras
    #zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/gnu-utils
    #zgen oh-my-zsh plugins/tmuxinator
    #zgen oh-my-zsh plugins/boot2docker
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/docker-compose
    #zgen oh-my-zsh plugins/mvn
    #zgen oh-my-zsh plugins/gradle
    zgen oh-my-zsh plugins/aws
    #zgen oh-my-zsh plugins/gpg-agent
    #zgen oh-my-zsh plugins/terraform


    zgen load zsh-users/zsh-syntax-highlighting
    zgen load sorin-ionescu/prezto modules/git/alias.zsh

    # completions
    #zgen load zsh-users/zsh-completions src
    zgen load littleq0903/gcloud-zsh-completion src
    zgen load zx2c4/password-store src/completion/pass.zsh-completion

    # theme
    zgen load denysdovhan/spaceship-zsh-theme spaceship

    # Git
    zgen load djui/alias-tips

    #compinit

    # save all to init script
    zgen save
fi


## Spaceship theme
export SPACESHIP_NVM_SHOW=false
export SPACESHIP_NODE_SHOW=false
export SPACESHIP_RUBY_SHOW=false
export SPACESHIP_VENV_SHOW=false
export SPACESHIP_DIR_TRUNC_REPO=false
export SPACESHIP_PACKAGE_SHOW=false
export SPACESHIP_VI_MODE_SHOW=true
export SPACESHIP_DOCKER_SHOW=false
# Number of folders to truncate of cwd (0=disabled)
export SPACESHIP_DIR_TRUNC=0

# Add gnue coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# Add postgresql
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
# Home/bin
export PATH="$PATH:$HOME/bin"
# Save history after command rather than after shell exit
setopt INC_APPEND_HISTORY


## Exports
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export GPG_TTY=`tty`

export LC_ALL="en_US.UTF-8"


export EDITOR="vim"


zstyle :omz:plugins:ssh-agent agent-forwarding on

### Includes
# Load autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

source ~/.aliases
for f in ${HOME}/dev/dotfiles/shell-extra/*; do
    source "$f"
done

# Disable shared history
unsetopt share_history

# forward/backward
#bindkey -e
#bindkey '^[^[[D' forward-word
#bindkey '^[^[[C' backward-word


test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# Rbenv
#eval "$(rbenv init -)"

# Golang
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Python
## Homebrew python should come before system python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

