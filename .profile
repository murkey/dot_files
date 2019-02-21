# color ls!
export CLICOLOR='yes'
export LSCOLORS='gxfxcxdxbxegedabagacad'

# smart-case searching, verbose prompt, handle ANSI color characters, keep output on screen
export LESS='--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --no-init'

# color grep matches
export GREP_OPTIONS='--color=auto'

# default editor
export EDITOR='nvim'

# aliases
alias ll='ls -lAh'
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias f='find . -iname'

# git
if type git > /dev/null 2>&1; then
  alias g='git'
  alias s='git status --show-stash --untracked-files=all'
  alias l='git log --stat'
  alias lg='git log --oneline --graph'
  alias d='git diff'
  alias ds='git diff --staged'
  alias co='git checkout'
  alias c='git commit'
  alias a='git add'
  alias ff='git merge --ff-only'
  alias p='git pull'
fi

if type brew > /dev/null 2>&1; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
  export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

if type gsed > /dev/null 2>&1; then
  alias sed='gsed'
fi

if type pgrep > /dev/null 2>&1; then
  alias pgrep='pgrep -L'
fi

if type ag > /dev/null 2>&1; then
  alias ag='ag --hidden -B2 -A2 --pager less --path-to-ignore $HOME/.agignore'
fi

if type rg > /dev/null 2>&1; then
  alias rg='rg --smart-case --hidden -B2 -A2 --pretty'
fi

if [ -d '/Applications/Android Studio.app' ]; then
  export PATH="$PATH:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools"
fi

if [ -d "$HOME/.rbenv" ]; then
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.yarn" ]; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  alias y='yarn'
fi

if [ -d "$HOME/.nodenv" ]; then
  eval "$(nodenv init -)"
  export PATH="./node_modules/.bin:$PATH"
fi

if [ -d "$HOME/.pyenv" ]; then
  eval "$(pyenv init -)"
fi
