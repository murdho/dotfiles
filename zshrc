# Path to your oh-my-zsh installation.
export ZSH=/Users/murdho/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fishy-murdho"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Let's keep the history.
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ssh-agent rails docker buffalo minikube)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[ -r ~/.aliasrc ] && . ~/.aliasrc

# Load ~/.profile
[ -r ~/.profile ] && . ~/.profile

# default editor
export EDITOR=vim

# enable vi mode
bindkey -v
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1

# postgres.app command line stuff
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# load private env variables
[ -f ~/.env-private ] && source ~/.env-private

# cooler backwards search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# for some coverage thingies
# export COVERAGE=true

# Go
if [ -x "$(command -v go)" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH="/Users/murdho/Developer/golang"
  export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
fi

# docker-compose autocomplete
fpath=(~/.zsh/completion $fpath)

# + haskell stack autocomplete
autoload -Uz +X compinit && compinit -i
autoload -U +X bashcompinit && bashcompinit
if [ -x "$(command -v stack)" ]; then
    eval "$(stack --bash-completion-script stack)"
fi

# rbenv
if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

# stack global install path
export PATH=$PATH:/Users/murdho/.local/bin

# handle this annoying change https://github.com/robbyrussell/oh-my-zsh/pull/6611
export LESS='-R'

# Make Crystal tooling happy https://gist.github.com/murdho/8c3f16422c954a6793829f9bf5f8d1df
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig

# Set home for Java
if [ -x "$(command -v java)" ]; then
#  export JAVA_HOME=`/usr/libexec/java_home -v 11`
fi

# Make Ruby installer happy
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl --with-readline-dir=/usr/local/opt/readline"

# Google Cloud SDK stuff
#source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
#source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Jetbrains Toolbox shortcuts location
export PATH=$PATH:/Users/murdho/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/murdho/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/murdho/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/murdho/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/murdho/google-cloud-sdk/completion.zsh.inc'; fi

# Set the locale
export LC_ALL=en_GB.UTF-8

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/murdho/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Enable direnv (direnv.net)
eval "$(direnv hook zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
