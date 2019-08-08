# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/usr/local/share/flutter/bin:$PATH

eval $(thefuck --alias)

# Path to your oh-my-zsh installation.
export ZSH=/home/jeremy/.oh-my-zsh

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

COMPLETION_WAITING_DOTS="true"

plugins=(git osx node nvm npm history-substring-search z)

HISTORY_SUBSTRING_SEARCH_FUZZY=1

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nano'
fi

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

export ANDROID_SDK=/usr/local/opt/android-sdk
export ANDROID_SDK_ROOT=/Users/jeremy/.android/avd
export ANDROID_NDK=/usr/local/opt/android-ndk-r10e
export ANDROID_HOME="${ANDROID_SDK}"
export ANDROID_NDK_HOME="${ANDROID_NDK}"

function port() {
  lsof -n -i:$1 | grep LISTEN
}

# Kill process running on a port
function killport() {
 kill `lsof -i:$1 -t`
}

ulimit -f unlimited

# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jeremy/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jeremy/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jeremy/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jeremy/.nvm/versions/node/v6.10.3/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$PATH"

# Access executables installed for the current project
export PATH="./node_modules/.bin:$PATH"
