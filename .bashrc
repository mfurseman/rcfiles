# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Force prompt to write history after every command.
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# enable color support of ls and also add handy aliases
if [ "$(uname)" = "SunOS" ]; then
    alias ls='gls --color=auto'
    alias dir='gdir --color=auto'
    alias vdir='gvdir --color=auto'
    alias grep='ggrep --color=auto'
    alias tar='gtar'
    alias git='/usr/local/depot/git-1.6.4.4/bin/git'
else
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

alias ll='ls -lF'
alias la='ls -A'
alias fgrep='grep -F'
alias egrep='grep -E'

# No real reason to use unimproved vim
alias vi='vim'

# Makes a Git life a bit easier
alias gk='gitk --all --date-order &'
alias gf='git fetch --all --prune'
alias gg='git gui &'
alias gd='git diff'
alias gl='git log --graph --abbrev-commit --pretty=oneline --decorate --date-order --all'
alias gs='git status'  ## Watch out when using ghostscript

# Get human readable output from du
alias dh='du -h --max-depth=1'

# Use colouring from parent shell in the rare occassion of using tmux
alias tmux='tmux -2'

# Help setup environment for local installation directories
function set_path {
    if [ -d "${1}" ]; then
        path="$(realpath ${1})"
        export PATH="${path}/bin:$PATH"
        export LD_LIBRARY_PATH="${path}/lib:${path}/lib64/:$LD_LIBRARY_PATH"
    fi
}

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Command for use in PS1
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[\[\e[1m\]\[\e[32m\]\u\[\e[m\]@\\[\e[1m\]\[\e[32m\]\h\[\e[m\] \[\e[0m\]\W\\[\e[1m\]\[\e[34m\]\$(parse_git_branch)\[\e[m\]]\\$ "

# Vim, vim, vim
export EDITOR=vim
export SVN_EDITOR=vim

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the history file, don't overwrite it
shopt -s histappend

# Eternal bash history
export HISTFILESIZE=
export HISTSIZE=

# Change the history time format
export HISTTIMEFORMAT="[%F %T] "

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Change the file location because certain bash sessions truncate .bash_history # file upon close.
export HISTFILE=~/.bash_eternal_history

# Prefer locally installed applications
prefix="${HOME}/prefix"
set_path "${prefix}"

# If we're using WSL match themes with Windows
if [ -n "${WSL_DISTRO_NAME}" ]; then
    source theme_sync
fi
