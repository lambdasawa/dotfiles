function tig
    command -v tig 2>&1 >/dev/null || brew install tig

    command tig $argv
end
