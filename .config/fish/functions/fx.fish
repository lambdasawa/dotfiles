function fx
    command -v fx 2>&1 >/dev/null || brew install fx

    command fx $argv
end
