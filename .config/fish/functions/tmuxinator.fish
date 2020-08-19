function tmuxinator
    if ! has tmuxinator
        if is-mac
            brew install tmuxinator
        else if is-debian
            sudo apt install -y tmuxinator
        end
    end

    command tmuxinator $argv
end
