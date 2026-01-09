#!/usr/bin/env bash

function git_gitignore_new() {
  local -
  local gitignore_path="${1:-./.gitignore}"
  #local gitignore_stems=("Global/macOS" "Python" "Go" "C" "C++" "Global/Vim")
  local gitignore_stems=("Global/macOS" "Python" "Global/Vim")
  local github_base="https://github.com/github/gitignore/blob/main"
  local github_base_raw="https://raw.githubusercontent.com/github/gitignore/refs/heads/main"

  echo "Obliterating '${gitignore_path}'..."
  set -o noclobber
  set -o xtrace
  echo -n "" > "${gitignore_path}" || return 22
  set +o xtrace

  for stem in "${gitignore_stems[@]}"; do
    set -o xtrace
    echo "# ========= ${stem/Global\//}: ${github_base}/${stem}.gitignore =========" >> "${gitignore_path}"
    curl "${github_base_raw}/${stem}.gitignore" >> "${gitignore_path}"
    set +o xtrace
    echo "" >> "${gitignore_path}"
  done
}
