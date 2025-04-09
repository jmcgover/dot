#!/usr/bin/env bash

# FUNCTIONS
function mkcd() {
  mkdir "$@"
  cd "${@: -1}"
}

function ports() {
  netstat -tulanp
}

function csvtable() {
  column -s, -t
}

UNAME_S=$(uname -s)
if [[ "${UNAME_S}" == "Darwin" ]]; then
  function manpdf() {
    # man -t $1 | open -f -a /Applications/Preview.app # DEPRCATED in macOS Ventura
    # brew install ghostscript
    # man -t "${1}" | /usr/bin/env ps2pdf - - | open -f -a /System/Applications/Preview.app
    mandoc -T pdf "$(/usr/bin/env man -w ${@})" | open -f -a Preview
  }
fi

# ALIASES
alias ls="ls -G"
alias bc="bc -l"
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias tree="tree -C"

