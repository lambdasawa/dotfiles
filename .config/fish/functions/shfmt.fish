function shfmt
    command -v shfmt 2>&1 >/dev/null || brew install shfmt

    command shfmt $argv
end
