#!/usr/bin/env bash

export HOMEBREW_BUNDLE_FILE="${HOME}/.brew/bundlefile"
eval "$(/opt/homebrew/bin/brew shellenv)"

function brew_latest {
  local -
  set -o xtrace
  brew upgrade && brew update && brew upgrade
}

function brew_bundle {
  local -
  set -o xtrace
  brew bundle check || brew bundle install
}
