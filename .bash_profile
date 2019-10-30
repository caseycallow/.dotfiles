export VISUAL=vim
export EDITOR='$VISUAL'
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# --------------------------------------------------
# ------------------- PROMPT -----------------------
# --------------------------------------------------

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\n\033[33m\]\$(parse_git_branch)\[\033[00m\] \[\e[32m\] ➜  \[\e[0m\]"
export BLOCKSIZE=1k
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# --------------------------------------------------
# ----------------- NAVIGATION ---------------------
# --------------------------------------------------

alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias la='ls -FGlAhp'
cd() { builtin cd "$@"; la; }
alias cd..='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias f='open -a Finder ./'
alias c='clear'
alias v='vim .'
alias x='exit'

# --------------------------------------------------
# --------------------- GIT ------------------------
# --------------------------------------------------

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gd='git diff'
alias gds='git diff --cached'
alias go='git checkout'
alias gp='git pull'
alias gps='git push'
alias gpsx='git push && exit'
alias gpu='git push -u origin `git symbolic-ref --short HEAD`'
alias grh='git reset HEAD .'
alias gst='git stash'
alias gstp='git stash pop'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gbdr='git fetch -p && for branch in `git branch -vv | grep ": gone]" | awk "{print $1}"`; do git branch -D $branch; done'

# --------------------------------------------------
# ------------------ SHORTCUTS ---------------------
# --------------------------------------------------

alias dot='cd ~/.dotfiles && vim .'
alias pro='cd ~/projects'

# --------------------------------------------------
# ------------------- SYSTEM -----------------------
# --------------------------------------------------

alias sleep='sudo shutdown -s now'
alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'
