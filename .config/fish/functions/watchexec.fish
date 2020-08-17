function watchexec
    command -v watchexec 2>&1 >/dev/null || brew install watchexec

    command watchexec $argv
end
