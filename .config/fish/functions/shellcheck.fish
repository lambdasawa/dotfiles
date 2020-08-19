function shellcheck
    if ! has shellcheck
        if is-mac
            brew install shellcheck
        else if is-debian
            sudo apt install -y shellcheck
        end
    end

    command shellcheck $argv
end
