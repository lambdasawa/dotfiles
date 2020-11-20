#!/bin/bash

set -xe

export PATH=$PATH:$HOME/bin

function create-dirs() {
  mkdir -p ~/src ~/bin ~/opt ~/tmp
}

function create-rep-dir-symlink-for-ghq() {
  mkdir -p ~/src/github.com/lamb-sbx
  rm -f ~/src/github.com/lamb-sbx/dotfiles
  ln -sf $HOME/.dotfiles $HOME/src/github.com/lamb-sbx/
}

function create-dotfiles-symlink() {
  for path in $(find ./bin -type f | grep -v '.sh$'); do
    mkdir -p $HOME/$(dirname $path)
    ln -sf $PWD/$path $HOME/$path
  done

  for path in $(find . -type f | grep -v '.git/' | grep -e '^\./\.'); do
    mkdir -p $HOME/$(dirname $path)
    ln -sf $PWD/$path $HOME/$path
  done
}

function craete-makefile-symlink() {
  ln -sf $PWD/Makefile $HOME/Makefile
}

function update-packages() {
  if is-mac; then
    if ! command -v brew; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi

    brew upgrade
  elif is-debian; then
    sudo apt update -y
    sudo apt upgrade -y
  fi
}

function setup-fish() {
  if ! command -v fish; then
    if is-mac; then
      brew install fish
    elif is-debian; then
      sudo apt install -y fish
    fi
  fi
}

function main() {
  create-dirs
  create-rep-dir-symlink-for-ghq
  craete-makefile-symlink
  create-dotfiles-symlink
  update-packages
  setup-fish
}

main

echo "./update.sh success!"
