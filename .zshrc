 # If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# To make 'psql' work without -h commands
export PGHOST=localhost

eval $(thefuck --alias)

export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH=/Users/jeremy/code/convoyinc/ops/.tools:$PATH
export VAULT_CAPATH=/Users/jeremy/code/convoyinc/credentials/convoy-vault-ca.cert.pem
export VAULT_ADDR=https://10.10.27.22:8200

export PATH="/Users/jeremy/go/bin":$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias ne='PATH=$(npm bin):$PATH'
alias gup='git up'
alias reload_profile='source ~/.zshrc'

# Path to your oh-my-zsh installation.
export ZSH=/Users/jeremy/.oh-my-zsh

function get_pass() {
  if ! $(op get account > /dev/null 2>&1); then
    eval $(op signin moseleys)
  fi
  op get item $1 | jq -r '.details.fields[] | select(.designation=="password").value'
}

function docker_login() {
  aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 699536110035.dkr.ecr.us-west-2.amazonaws.com
}

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="sobole"

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
plugins=(git golang osx node nvm npm history-substring-search z brew web-search sudo zsh-autosuggestions)

HISTORY_SUBSTRING_SEARCH_FUZZY=1

source $ZSH/oh-my-zsh.sh

# Activate aws cli
export PATH="/usr/local/opt/awscli@1/bin:$PATH"

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

function port() {
  lsof -n -i:$1 | grep LISTEN
}

# Kill process running on a port
function killport() {
 kill `lsof -i:$1 -t`
}

$(aws-okta env prod-rw)

#export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
#export AWS_ACCESS_KEY=$(aws configure get aws_access_key_id)
#export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)
#export AWS_SECRET_KEY=$(aws configure get aws_secret_access_key)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$PATH"

export CONVOY_OPS_DIR=~/src

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

export PATH=$PATH:/usr/local/go/bin

function fix-prettier-changed() {
    for file in $(git diff --name-only master); do
        yarn prettier --write $file
    done
}

export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/jeremy/.gem/ruby/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

reload_config() {
  source ~/.zshrc
}
source /Users/jeremy/.convoyrc
