#!/usr/bin/env bash

set -o noclobber nounset errexit

SOURCES=("env")
TARGET_DIR="${HOME}/.elan"

function check_targets() {
  echo 'Checking targets...'
  for src in "${SOURCES[@]}" "${BASHFOLDER}"; do
    target_filename="${TARGET_DIR}/${src}"
    if [ -f "${target_filename}" ]; then
      echo "Target file already exists: ${target_filename}"
      return 22
    fi
    echo "Does not exist: ${target_filename}"
  done
  echo 'Checking targets DONE'
}

function check_sources() {
  echo 'Checking sources...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  for src in "${SOURCES[@]}"; do
    source_filename="${basedir}/${src}"
    if [ ! -f "${source_filename}" ]; then
      echo "Source file does not exist: ${source_filename}"
      return 22
    fi
    echo "Exists: ${source_filename}"
  done
  echo 'Checking sources DONE'
}

function link_dotfiles() {
  echo 'Linking dotfiles...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  for src in "${SOURCES[@]}"; do
    source_filename="${basedir}/${src}"
    target_filename="${TARGET_DIR}/${src}"
    ln -v -w -s "${source_filename}" "${target_filename}"
  done
  ln -v -w -s "${basedir}" "${HOME}/.${BASHFOLDER}"
  echo 'Linking dotfiles DONE'
}

function install() {
  local -
  set -o xtrace
  # https://lean-lang.org/install/manual/
  curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
}

function main() {
  echo 'Infecting...'
  check_targets || return $?
  check_sources || return $?
  link_dotfiles || return $?
  install || return $?
  echo 'Infecting DONE'
}

main "$@"
