function moreutils
    if ! has chronic
        if is-mac
            brew install moreutils
        else if is-debian
            sudo apt install -y moreutils
        end
    end
end
