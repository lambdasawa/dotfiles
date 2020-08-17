function ghq
    command -v ghq 2>&1 >/dev/null || brew install ghq

    command ghq $argv
end
