#!/usr/bin/env bash

set -o noclobber nounset errexit

COWDIR="cows"

function check_targets() {
  echo 'Checking targets...'
  target_filename="${HOME}/.${COWDIR}/mine/"
  if [ -f "${target_filename}" ]; then
    echo "Target file already exists: ${target_filename}"
    exit 22
  fi
  if [ -d "${target_filename}" ]; then
    echo "Target directory already exists: ${target_filename}"
    exit 22
  fi
  echo "Does not exist: ${target_filename}"
  echo 'Checking targets DONE'
}


function check_sources() {
  echo 'Checking sources...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  if [ ! -d "${basedir}" ]; then
    echo "Source ${basedir} directory does not exist: ${source_filename}"
    exit 22
  fi
  echo 'Checking sources DONE'
}

function link_dotfiles() {
  echo 'Linking dotfiles...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  mkdir -p "${HOME}/.${COWDIR}"
  ln -v -w -s "${basedir}" "${HOME}/.${COWDIR}/mine"
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
