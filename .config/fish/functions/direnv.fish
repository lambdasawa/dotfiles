function direnv
    command -v direnv 2>&1 >/dev/null || brew install direnv

    command direnv $argv
end
