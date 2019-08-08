# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/usr/local/share/flutter/bin:$PATH

# To make 'psql' work without -h commands
export PGHOST=localhost

eval $(thefuck --alias)

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=/Users/jeremy/src/ops/.tools:$PATH
export VAULT_CAPATH=/Users/jeremy/src/ops/credentials/convoy-vault-ca.cert.pem
export VAULT_ADDR=https://10.10.27.22:8200

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

alias ne='PATH=$(npm bin):$PATH'
alias gup='git up'

# Path to your oh-my-zsh installation.
export ZSH=/Users/jeremy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="cloud"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx node nvm npm history-substring-search z brew)

HISTORY_SUBSTRING_SEARCH_FUZZY=1

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
alias zshconfig="nano ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

alias vlt='VAULT_ADDR=$(vault status -address=https://10.10.27.22:8200 |grep Leader|sed "s/.*Leader: //") vault'

shitcan() { $* 2> /dev/null }

# call nvm use automatically whenever you enter a directory that contains an .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
 if [[ -f .nvmrc && -r .nvmrc ]]; then
   nvm use >/dev/null
 elif [[ $(nvm version) != $(nvm version default)  ]]; then
   nvm use default >/dev/null
 fi
}
add-zsh-hook chpwd load-nvmrc
# load-nvmrc

function pdb() {
  if [ -z "$1" ]
  then
    pgcli -U postgres -d shipotle_dev
  else
    pgcli -U postgres -d $1
  fi
}

export ANDROID_SDK=/usr/local/opt/android-sdk
export ANDROID_SDK_ROOT=/Users/jeremy/.android/avd
export ANDROID_NDK=/usr/local/opt/android-ndk-r10e
export ANDROID_HOME="${ANDROID_SDK}"
export ANDROID_NDK_HOME="${ANDROID_NDK}"
launchctl setenv ANDROID_HOME "${ANDROID_HOME}"
launchctl setenv ANDROID_NDK_HOME "${ANDROID_NDK_HOME}"
launchctl setenv ANDROID_SDK "${ANDROID_SDK}"
launchctl setenv ANDROID_SDK_ROOT "${ANDROID_SDK_ROOT}"
launchctl setenv ANDROID_NDK "${ANDROID_NDK}"

function port() {
  lsof -n -i:$1 | grep LISTEN
}

# Kill process running on a port
function killport() {
 kill `lsof -i:$1 -t`
}

ulimit -n 65536 65536

export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_ACCESS_KEY=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
export AWS_SECRET_KEY=$(aws configure get aws_secret_access_key)

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jeremy/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jeremy/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jeremy/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jeremy/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$PATH"

function awsCredsSwap() {
  if [ -e ~/.aws/convoy.credentials ]; then
    echo "Activating Convoy Creds"
    mv ~/.aws/credentials ~/.aws/jerez_z.credentials
    mv ~/.aws/convoy.credentials ~/.aws/credentials
  else
    echo "Activating person creds"
    mv ~/.aws/credentials ~/.aws/convoy.credentials
    mv ~/.aws/jerez_z.credentials ~/.aws/credentials
  fi
  source ~/.zshrc
}

eval "$(hub alias -s)"


# added by travis gem
[ -f /Users/jeremy/.travis/travis.sh ] && source /Users/jeremy/.travis/travis.sh

export GOPATH="/Users/jeremy/projects/go"
export PATH="./node_modules/.bin:$GOPATH/bin:$PATH"

export CONVOY_OPS_DIR=~/src
export PATH="/usr/local/opt/mysql@5.5/bin:$PATH"
