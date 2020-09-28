function tig
    if ! has tig
        if is-mac
            brew install tig
        else if is-debian
            sudo apt install -y tig
        end
    end

    command tig $argv
end
