#!/usr/bin/env bash

set -o noclobber nounset errexit

VIMRC="vimrc"
VIMDIR_TARGET="vim"
VIMDIR_SOURCE="vimdir"

TARGETS=("${VIMRC}" "${VIMDIR_TARGET}")
SOURCES=("${VIMRC}" "${VIMDIR_SOURCE}")

function check_targets() {
  echo 'Checking targets...'
  for target in "${TARGETS[@]}"; do
    target_filename="${HOME}/.${target}"
    if [ -f "${target_filename}" ]; then
      echo "Target file already exists: ${target_filename}"
      exit 22
    fi
    if [ -d "${target_filename}" ]; then
      echo "Target directory already exists: ${target_filename}"
      exit 22
    fi
    echo "Does not exist: ${target_filename}"
  done
  echo 'Checking targets DONE'
}

function check_sources() {
  echo 'Checking sources...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  if [ ! -f "${basedir}/${VIMRC}" ]; then
    echo "Source ${VIMRC} file does not exist: ${source_filename}"
    exit 22
  fi
  if [ ! -d "${basedir}/${VIMDIR_SOURCE}" ]; then
    echo "Source ${VIMDIR_SOURCE} directory does not exist: ${source_filename}"
    exit 22
  fi
  echo 'Checking sources DONE'
}

function link_dotfiles() {
  echo 'Linking dotfiles...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  ln -v -w -s "${basedir}/${VIMRC}" "${HOME}/.${VIMRC}"
  ln -v -w -s "${basedir}/${VIMDIR_SOURCE}" "${HOME}/.${VIMDIR_TARGET}"
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

