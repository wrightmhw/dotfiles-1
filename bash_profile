export CLICOLOR=1

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
parse_git_dirty() {
  local SUBMODULE_SYNTAX=''
  if [[ $POST_1_7_2_GIT -gt 0 ]]; then
    SUBMODULE_SYNTAX="--ignore-submodules=dirty"
  fi
  if [[ -n $(git status -s ${SUBMODULE_SYNTAX}  2> /dev/null) ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}
export PS1="\[\e[0;33m\]< \h:\W \u >\[\e[m\] "
export PS1='\[\e[0;33m\]\W\[\e[m\] \[\e[0;22m\]$(git_prompt_info)\[\e[m\] \[\e[0;33m\]>\[\e[m\] '

# PATH Modifications

## For Homebrew
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"

## For Rbenv
PATH="/Users/graysonwright/.rbenv/shims:$PATH"

## For git-annex
PATH="$PATH:/Applications/git-annex.app/Contents/MacOS"

## For user-defined functions
PATH="$HOME/bin:$PATH"
export PATH

# Boxen
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Import other user-defined functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
