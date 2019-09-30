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

# git
if type git > /dev/null 2>&1; then
  alias g='git'

  alias a='git add'
  alias ci='git commit'
  alias co='git checkout'
  alias d='git diff'
  alias ds='git diff --staged'
  alias ff='git merge --ff-only'
  alias l='git log --stat'
  alias lg='git log --oneline --graph'
  alias p='git pull'
  alias s='git status --show-stash --untracked-files=all'
fi

# homebrew
if type brew > /dev/null 2>&1; then
  export PATH="/usr/local/bin:$PATH"
fi

# neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# ripgrep
if type rg > /dev/null 2>&1; then
  # https://github.com/BurntSushi/ripgrep/issues/86
  rg() {
    if [ -t 1 ]; then
      command rg --smart-case --hidden -B2 -A2 --pretty "$@" | less
    else
      command rg "$@"
    fi
  }
  alias f='rg --files --iglob'
else
  alias f='find . -iname'
fi

# android
if [ -d '/Applications/Android Studio.app' ]; then
  export PATH="$PATH:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools"
fi

# yarn
if type yarn > /dev/null 2>&1; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  export PATH="./node_modules/.bin:$PATH"
  alias y='yarn'
fi

# nodenv
if type nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi

# rbenv
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# pyenv
if type pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
