#!/usr/bin/env bash

set -o noclobber nounset errexit

BTOPFOLDER="btop"

function check_targets() {
  echo 'Checking targets...'
  global_config_dir="${HOME}/.config"
  if [ ! -d "${global_config_dir}" ]; then
    echo "Global config folder does not exist: ${global_config_dir}"
    exit 22
  fi
  echo 'Checking targets DONE'
}

function check_sources() {
  echo 'Checking sources...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  if [ ! -d "${basedir}" ]; then
    echo "Source directory somehow does not exist: ${basedir}"
    exit 22
  fi
  echo 'Checking sources DONE'
}

function link_dotfiles() {
  echo 'Linking dotfiles...'
  basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  global_config_dir="${HOME}/.config"
  ln -v -w -s "${basedir}" "${global_config_dir}/${BTOPFOLDER}"
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
