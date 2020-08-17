function tmuxinator
    command -v tmuxinator 2>&1 >/dev/null || brew install tmuxinator

    command tmuxinator $argv
end
