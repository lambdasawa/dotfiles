function tmux
    if ! has tmux
        if is-mac
            brew install tmux
        else if is-debian
            sudo apt install -y tmux
        end
    end

    command tmux $argv
end
