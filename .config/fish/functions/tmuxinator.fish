function tmuxinator
    if ! has tmuxinator
        gem install tmuxinator
    end

    command tmuxinator $argv
end
