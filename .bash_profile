# Change Prompt
# ------------------------------------------------------------

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\n\033[33m\]\$(parse_git_branch)\[\033[00m\] \[\e[32m\] ➜ \[\e[0m\]"

export BLOCKSIZE=1k

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Navigation
# ------------------------------------------------------------

alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias la='ls -FGlAhp'                       # Preferred 'ls' implementation
cd() { builtin cd "$@"; la; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # Opens current directory in MacOS Finder
alias c='clear'                             # Clear terminal display
alias v='vim .'                             # Open Vim shortcut

# Git Commands
# ------------------------------------------------------------

alias gs='git status'                       # Git status
alias ga='git add'                          # Git add
alias gc='git commit'                       # Git commit
alias gb='git branch'                       # Git branch
alias gd='git diff'                         # Git diff
alias gds='git diff --cached'               # Git diff only staged files
alias go='git checkout'                     # Git checkout
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit' # Git log

# Project Shortcuts
alias vds='cd ~/projects/veritas-design-system && vim .'
alias dot='cd ~/.dotfiles && vim .'
