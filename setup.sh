#!/bin/bash

set -xeuo pipefail

if [ "$(uname)" == "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    brew upgrade

    brew install --cask \
        1password \
        firefox \
        visual-studio-code \
        docker \
        aws-vault \
        session-manager-plugin \
        google-cloud-sdk \
        intellij-idea \
        raycast \
        slack

    brew install \
        fish \
        gh \
        starship \
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
        jc \
        gron \
        jless \
        dsq \
        csview \
        htmlq \
        mdcat \
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
