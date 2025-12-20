#!/usr/bin/env bash

function install() {
  local -
  set -o xtrace errexit
  # https://ocaml.org/install#linux_mac_bsd
  # Use ~/.local/bin (it won't expand ${HOME})
  bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)" <<-INPUT
    ~/.local/bin
    Y
INPUT
  opam init || return $?
  eval $(opam env) || return $?
  opam install ocaml-lsp-server odoc ocamlformat utop || return $?
}

export ISO8601_FMT='%Y-%m-%dT%H:%M:%S%Z'
function date_filesafe() {
    date +"${ISO8601_FMT}" | tr -d ':'
}

function uninstall() {
  mv -v "$(which opam)" "${HOME}/.Trash"
  mv -v "${HOME}/.opam" "/.Trash/opam_$(date_filesafe)"
}

function main() {
  echo 'Infecting...'
  install || return $?
  echo 'Infecting DONE'
}

main "$@"
