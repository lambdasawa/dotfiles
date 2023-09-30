#!/bin/bash

set -xeuo pipefail

DOTFILES_DIRECTORY="$(dirname $(realpath ${BASH_SOURCE[0]}))"

ln -sf "$DOTFILES_DIRECTORY/.gitconfig" "$HOME/.gitconfig"

mkdir -p "$HOME/.config/fish"
ln -sf "$DOTFILES_DIRECTORY/config.fish" "$HOME/.config/fish/config.fish"

ln -sf "$DOTFILES_DIRECTORY/starship.toml" "$HOME/.config/starship.toml"

mkdir -p "$HOME/.config/zellij"
ln -sf "$DOTFILES_DIRECTORY/zellij.kdl" "$HOME/.config/zellij/config.kdl"

if [ "$(uname)" == "Darwin" ]; then
    if [ ! -e /opt/homebrew/bin/brew ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$(/opt/homebrew/bin/brew shellenv)"

    brew upgrade

    brew install --cask \
        1password \
        firefox \
        google-chrome \
        visual-studio-code \
        docker \
        aws-vault \
        session-manager-plugin \
        google-cloud-sdk \
        intellij-idea \
        raycast \
        slack \
        homebrew/cask-fonts/font-jetbrains-mono \
        google-japanese-ime

    brew install \
        fish \
        zellij \
        gh \
        ghq \
        gitui \
        starship \
        docker-compose \
        direnv \
        zoxide \
        rtx \
        watchexec \
        go-task/tap/go-task \
        1password-cli \
        eza \
        bat \
        difftastic \
        git-delta \
        ripgrep \
        fd \
        broot \
        sd \
        sk \
        jq \
        jless \
        gron \
        jc \
        pup \
        mdcat \
        csview \
        pandoc \
        graphviz \
        hexyl \
        ouch \
        xh \
        k6 \
        mitmproxy \
        mysql \
        postgresql@14 \
        sqldef/sqldef/mysqldef \
        sqldef/sqldef/psqldef \
        redis \
        ffmpeg \
        mpv \
        sox \
        awscli \
        awscurl \
        scrcpy \
        yt-dlp
fi
