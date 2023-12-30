#!/bin/bash

set -xeuo pipefail

DOTFILES_DIRECTORY="$(dirname $(realpath ${BASH_SOURCE[0]}))"

mkdir -p "$HOME/.config/git"
ln -sf "$DOTFILES_DIRECTORY/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIRECTORY/git/ignore" "$HOME/.config/git/ignore"

mkdir -p "$HOME/.config/fish"
ln -sf "$DOTFILES_DIRECTORY/fish/config.fish" "$HOME/.config/fish/config.fish"

ln -sf "$DOTFILES_DIRECTORY/starship/starship.toml" "$HOME/.config/starship.toml"

mkdir -p "$HOME/.config/wezterm"
ln -sf "$DOTFILES_DIRECTORY/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

mkdir -p ~/.config/rtx
ln -sf "$DOTFILES_DIRECTORY/rtx/.default-python-packages" "$HOME/.default-python-packages"
ln -sf "$DOTFILES_DIRECTORY/rtx/.default-gems" "$HOME/.default-gems"
ln -sf "$DOTFILES_DIRECTORY/rtx/.default-npm-packages" "$HOME/.default-npm-packages"
ln -sf "$DOTFILES_DIRECTORY/rtx/.default-go-packages" "$HOME/.default-go-packages"
ln -sf "$DOTFILES_DIRECTORY/rtx/.rtx.toml" "$HOME/.config/rtx/config.toml"

mkdir -p "$HOME/.config/tridactyl"
mkdir -p "$HOME/.config/tridactyl/js"
mkdir -p "$HOME/.config/tridactyl/themes"
for path in $(find tridactyl -type f); do
    ln -sf "$DOTFILES_DIRECTORY/$path" "$HOME/.config/$path"
done

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
        wezterm \
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
        mike-engel/jwt-cli/jwt-cli \
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
elif uname -a | grep 'Linux kali' >/dev/null; then
    sudo apt update -y
    sudo apt install -y fish
    curl -fsSL https://starship.rs/install.sh | env FORCE=1 sh
    curl -fsSL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    curl -fsSL https://direnv.net/install.sh | bash
    curl https://rtx.pub/install.sh | sh
fi
