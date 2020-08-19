function hub
    if ! has hub
        if is-mac
            brew install hub
        else if is-debian
            sudo apt install -y hub
        end
    end

    command hub $argv
end
