function zoxide
    command -v zoxide 2>&1 >/dev/null || brew install zoxide

    command zoxide $argv
end
