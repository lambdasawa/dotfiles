function sk
    command -v sk 2>&1 >/dev/null || brew install sk

    command sk $argv
end
