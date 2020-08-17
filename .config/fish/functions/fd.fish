function fd
    command -v fd 2>&1 >/dev/null || brew install fd

    command fd $argv
end
