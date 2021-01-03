if ! command -v zoxide 2>&1 >/dev/null
    if is-mac
        brew install zoxide
    else if is-debian
        curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/master/install.sh | sh
    end
end

zoxide init fish | source
