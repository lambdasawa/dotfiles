#!/bin/bash

set -xe

export PATH=$PATH:$HOME/bin

function create-dirs() {
  mkdir -p ~/src ~/bin ~/opt ~/tmp
}

function create-rep-dir-symlink-for-ghq() {
  mkdir -p ~/src/github.com/lambdasawa
  rm -f ~/src/github.com/lambdasawa/.dotfiles
  ln -sf $HOME/.dotfiles $HOME/src/github.com/lambdasawa/
}

function remove-dotfiles-broken-symlink() {
  for dir in ~ ~/.config/fish/functions; do
    for path in $(find $dir -type l -maxdepth 1); do
      if file $path | grep "broken symbolic link" 2>&1 >/dev/null; then
        rm $path
      fi
    done
  done
}

function create-dotfiles-symlink() {
  for path in $(find ./bin -type f | grep -v '.sh$'); do
    mkdir -p $HOME/$(dirname $path)
    ln -sf $PWD/$path $HOME/$path
  done

  for path in $(find . -type f | grep -v '\.git/' | grep -e '^\./\.'); do
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

function update-asdf() {
  if which fish && which asdf; then
    fish -c 'asdf-update'
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
  git pull
  create-dirs
  create-rep-dir-symlink-for-ghq
  craete-makefile-symlink
  remove-dotfiles-broken-symlink
  create-dotfiles-symlink
  update-packages
  update-asdf
  setup-fish
}

main

echo "./update.sh success!"
