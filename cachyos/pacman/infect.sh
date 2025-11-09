#!/usr/bin/env bash

set -o noclobber nounset errexit

PKGLISTS=("cli.txt" "devel.txt" "tools.txt" "games.txt" "python.txt" "latex.txt" "window.txt" "desktop.txt" "cachyos.txt")

function check_sources() {
  echo 'Checking sources...'
  local basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  for base in "${PKGLISTS[@]}"; do
    local source_filename="${basedir}/${base}"
    if [ ! -f "${source_filename}" ]; then
      echo "Source file does not exist: ${source_filename}"
      exit 22
    fi
    echo "Exists: ${source_filename}"
  done
  echo 'Checking sources DONE'
}

function install_packages() {
  echo 'Installing packages...'
  local basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  local pkglists_absolute=()
  for pkglist in "${PKGLISTS[@]}"; do
    pkglists_absolute+=("${basedir}/${pkglist}")
  done
  set -o xtrace
  cat "${pkglists_absolute[@]}" | sort | uniq
  cat "${pkglists_absolute[@]}" | sudo pacman --needed --sync --refresh --refresh --sysupgrade -
  set +o xtrace
  echo 'Installing packages DONE'
}

function main() {
  echo 'Infecting...'
  check_sources
  install_packages
  echo 'Infecting DONE'
}

main "$@"
