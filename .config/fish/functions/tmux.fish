function tmux
    command -v tmux 2>&1 >/dev/null || brew install tmux

    command tmux $argv
end
