#!/usr/bin/env bash

set -o noclobber nounset errexit

SOURCES=("dconf-settings.ini")

function check_sources() {
  set -o nounset
  echo 'Checking sources...'
  local basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  for base in "${SOURCES[@]}"; do
    local source_filename="${basedir}/${base}"
    if [ ! -f "${source_filename}" ]; then
      echo "Source file does not exist: ${source_filename}"
      exit 22
    fi
    echo "Exists: ${source_filename}"
  done
  echo 'Checking sources DONE'
}

function import_settings() {
  set -o nounset
  echo 'Importing settings...'
  local basedir="$(dirname $(realpath ${BASH_SOURCE:-$0}))"
  local sources_absolute=()
  for pkglist in "${SOURCES[@]}"; do
    sources_absolute+=("${basedir}/${pkglist}")
  done
  set -o xtrace
  cat "${sources_absolute[@]}" | dconf load /
  set +o xtrace
  echo 'Importing settings DONE'
}

function main() {
  echo 'Infecting...'
  check_sources
  import_settings
  echo 'Infecting DONE'
}

main "$@"

