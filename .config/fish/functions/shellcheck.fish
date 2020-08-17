function shellcheck
    command -v shellcheck 2>&1 >/dev/null || brew install shellcheck

    command shellcheck $argv
end
