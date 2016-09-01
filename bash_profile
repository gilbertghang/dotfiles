export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]funbox:\[\033[33;1m\]\w\[\033[m\]\$ "

alias ll="ls -FG"

function cs() {
  cd "$@" && ll
}

alias ..="cs .."
alias ...="cs ../.."
