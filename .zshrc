 # If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

eval $(thefuck --alias)

export GPG_TTY=$(tty)
export PATH=/usr/local/share/flutter/bin:$PATH
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools/
export PATH=$PATH:$HOME/Library/Android/sdk/emulator/

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias gup='git up'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="cloud"

COMPLETION_WAITING_DOTS="true"

plugins=(git macos node nvm npm history-substring-search z zsh-autosuggestions)

HISTORY_SUBSTRING_SEARCH_FUZZY=1

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nano'
fi

alias master="git co master && git up"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# brew on M1 puts files in a different place, this helps with certain native packages (such as canvas)
export CPLUS_INCLUDE_PATH=/opt/homebrew/include

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

export PATH="$PATH:$HOME/code/tools/flutter/bin"

# Access executables installed for the current project
export PATH="./node_modules/.bin:$PATH"

function reload_config() {
  source ~/.zshrc
}

# Download Znap, if it's not there yet.
[[ -f ~/code/znap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/code/znap/zsh-snap

source ~/code/znap/zsh-snap/znap.zsh  # Start Znap

# `znap prompt` makes your prompt visible in just 15-40ms!
# znap prompt sindresorhus/pure

# `znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete
# znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting

eval "$(atuin init zsh)"

. $HOME/.cargo/env

dura serve > /dev/null 2>&1 &

export NOMAD_ADDR=https://nomad.internal.classdojo.com

mm () {
        local API_DIR="/Users/andrew/code/dojo/api"
        local grepStr="$1"
        if [ $(pwd) != "$API_DIR" ]
        then
                echo "not in api dir, changing"
                cd "$API_DIR"
        fi
        if [ $(ps aux | grep "Docker.app" | grep -vc grep) = 0 ]
        then
                echo "Docker.app closed, opening"
                open -a Docker.app
                sleep 15
        fi
        if [ $(docker ps | wc -l | awk '{print $1}') = 1 ]
        then
                echo "containers down, upping"
                make pre-start
        fi
        yarn run mocha -g "$grepStr"
}
