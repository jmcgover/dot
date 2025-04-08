#!/usr/bin/env bash

set -o noclobber nounset errexit

BASHFILES=("bashrc" "bash_profile" "bash_login" "bash_logout")
BASHFOLDER="bash"

function check_targets() {
  echo 'Checking targets...'
  for base in "${BASHFILES[@]}" "${BASHFOLDER}"; do
    target_filename="${HOME}/.${base}"
    if [ -f "${target_filename}" ]; then
      echo "Target file already exists: ${target_filename}"
      exit 22
    fi
    echo "Does not exist: ${target_filename}"
  done
  echo 'Checking targets DONE'
}

function check_sources() {
  echo 'Checking sources...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  for base in "${BASHFILES[@]}"; do
    source_filename="${basedir}/${base}"
    if [ ! -f "${source_filename}" ]; then
      echo "Source file does not exist: ${source_filename}"
      exit 22
    fi
    echo "Exists: ${source_filename}"
  done
  echo 'Checking sources DONE'
}

function link_dotfiles() {
  echo 'Linking dotfiles...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  for base in "${BASHFILES[@]}"; do
    source_filename="${basedir}/${base}"
    target_filename="${HOME}/.${base}"
    ln -v -w -s "${source_filename}" "${target_filename}"
  done
  ln -v -w -s "${basedir}" "${HOME}/.${BASHFOLDER}"
  echo 'Linking dotfiles DONE'
}

function main() {
  echo 'Infecting...'
  check_targets
  check_sources
  link_dotfiles
  echo 'Infecting DONE'
}

main "$@"
