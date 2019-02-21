# completion
if [ -d /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit && compinit
setopt no_auto_menu
setopt no_beep

# prompt
source $HOME/.zsh/git-prompt
source $HOME/.zsh/nodenv-prompt
autoload -U colors && colors
setopt prompt_subst
PROMPT='%n@%m %F{cyan}%~%f $(_zsh_git_prompt)%(?..%F{red})♪%f '
RPROMPT='$(_zsh_nodenv_prompt)'

# put current directory in the title
precmd () {print -Pn "\e]0;%~\a"}

# key bindings
bindkey -e
bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# history
SAVEHIST=5000
HISTSIZE=$SAVEHIST
HISTFILE=$HOME/.zsh_history
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS

# slashes aren't words
WORDCHARS=''

# spaces are ok for | and &
# ZLE_REMOVE_SUFFIX_CHARS=$' \t\n'
ZLE_SPACE_SUFFIX_CHARS=$'&|'

# comments are ok
setopt interactivecomments

source $HOME/.profile

if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
