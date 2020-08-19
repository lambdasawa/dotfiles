function aria2c
    if ! has aria2c
        if is-mac
            brew install aria2
        else if is-debian
            sudo apt install -y aria2
        end
    end

    command aria2c $argv
end
