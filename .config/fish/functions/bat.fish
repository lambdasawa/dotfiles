function bat
    if ! has bat
        if is-mac
            brew install bat
        else if is-debian
            sudo apt install -y bat
            ln -s /usr/bin/batcat ~/bin/bat
        end
    end

    command bat $argv
end
