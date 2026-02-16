# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Environment
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
. "$HOME/.local/bin/env"
. "$HOME/.cargo/env"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"
export MANPATH="/usr/local/texlive/2025/texmf-dist/doc/man:${MANPATH}"
export INFOPATH="/usr/local/texlive/2025/texmf-dist/doc/info:${INFOPATH}"

# Prompt
autoload -U colors && colors
PS1=$'\uf0a9 '
precmd() { print -Pn "\e]0;%~\a" }

# Aliases
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="zd"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lg='lazygit'
alias decompress="tar -xzf"

# Functions
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}
open() {
  xdg-open "$@" >/dev/null 2>&1 &
}
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }

# Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
