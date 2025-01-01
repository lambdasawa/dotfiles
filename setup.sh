#!/bin/bash

set -xeuo pipefail

DOTFILES_DIRECTORY="$(dirname $(realpath ${BASH_SOURCE[0]}))"

install-git-conf() {
    mkdir -p "$HOME/.config/git"
    ln -sf "$DOTFILES_DIRECTORY/git/config" "$HOME/.config/git/config"
    ln -sf "$DOTFILES_DIRECTORY/git/ignore" "$HOME/.config/git/ignore"
}

install-fish-conf() {
    mkdir -p "$HOME/.config/fish"
    ln -sf "$DOTFILES_DIRECTORY/fish/config.fish" "$HOME/.config/fish/config.fish"
}

install-mise-conf() {
    mkdir -p "$HOME/.config/mise"
    ln -sf "$DOTFILES_DIRECTORY/mise/.default-python-packages" "$HOME/.default-python-packages"
    ln -sf "$DOTFILES_DIRECTORY/mise/.default-gems" "$HOME/.default-gems"
    ln -sf "$DOTFILES_DIRECTORY/mise/.default-npm-packages" "$HOME/.default-npm-packages"
    ln -sf "$DOTFILES_DIRECTORY/mise/.default-go-packages" "$HOME/.default-go-packages"
    ln -sf "$DOTFILES_DIRECTORY/mise/config.toml" "$HOME/.config/mise/config.toml"
    ln -sf "$DOTFILES_DIRECTORY/mise/settings.toml" "$HOME/.config/mise/settings.toml"
}

install-starship-conf() {
    mkdir -p "$HOME/.config"
    ln -sf "$DOTFILES_DIRECTORY/starship/starship.toml" "$HOME/.config/starship.toml"
}

install-wezterm-conf() {
    mkdir -p "$HOME/.config/wezterm"
    ln -sf "$DOTFILES_DIRECTORY/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
}

install-tridactyl-conf() {
    mkdir -p "$HOME/.config/tridactyl"
    mkdir -p "$HOME/.config/tridactyl/js"
    mkdir -p "$HOME/.config/tridactyl/themes"
    for path in $(find tridactyl -type f); do
        ln -sf "$DOTFILES_DIRECTORY/$path" "$HOME/.config/$path"
    done
}

setup-brew() {
    if [ ! -e /opt/homebrew/bin/brew ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    eval "$(/opt/homebrew/bin/brew shellenv)"

    brew upgrade

    brew install --cask \
        1password \
        firefox \
        google-chrome \
        wezterm \
        visual-studio-code \
        aws-vault \
        session-manager-plugin \
        google-cloud-sdk \
        jetbrains-toolbox \
        raycast \
        slack \
        google-japanese-ime \
        chatgpt \
        claude \
        ngrok

    brew install \
        fish \
        starship \
        gh \
        ghq \
        lazygit \
        1password-cli \
        sk \
        pueue \
        zoxide \
        mise \
        asdf \
        watchexec \
        eza \
        bat \
        ripgrep \
        semgrep \
        ast-grep \
        difftastic \
        git-delta \
        fd \
        sd \
        choose-rust \
        jq \
        yq \
        jless \
        gron \
        jc \
        pup \
        mdcat \
        qsv \
        pandoc \
        graphviz \
        openssl \
        imagemagick \
        ffmpeg \
        yt-dlp \
        mpv \
        sox \
        hexyl \
        ouch \
        xh \
        dufs \
        k6 \
        docker-compose \
        mysql \
        postgresql@14 \
        sqldef/sqldef/mysqldef \
        sqldef/sqldef/psqldef \
        redis \
        uv \
        awscli \
        awscurl \
        scrcpy \
        apktool \
        android-commandlinetools \
        openvpn
}

if [ "$(uname)" == "Darwin" ]; then
    install-git-conf
    install-fish-conf
    install-mise-conf
    install-starship-conf
    install-wezterm-conf
    install-tridactyl-conf
    setup-brew
elif uname -a | grep 'Linux kali' >/dev/null; then
    sudo apt update -y
    sudo apt install -y fish
    curl -fsSL https://starship.rs/install.sh | env FORCE=1 sh
    curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    curl https://mise.jdx.dev/install.sh | sh
    sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin
fi
