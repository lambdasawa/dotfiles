function htop
    if ! has htop
        if is-mac
            brew install htop
        else if is-debian
            sudo apt install -y htop
        end
    end

    command htop $argv
end
