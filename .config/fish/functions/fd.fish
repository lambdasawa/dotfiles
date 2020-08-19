function fd
    if ! has fd
        if is-mac
            brew install fd
        else if is-debian
            sudo apt install -y fd-find
            ln -s /usr/bin/fdfind ~/bin/fd
        end
    end

    command fd $argv
end
