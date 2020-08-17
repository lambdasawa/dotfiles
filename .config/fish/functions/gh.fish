function gh
    command -v gh 2>&1 >/dev/null || brew install gh

    command gh $argv
end
