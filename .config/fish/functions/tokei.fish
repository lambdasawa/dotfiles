function tokei
    if ! has tokei
        if is-mac
            brew install tokei
        else if is-debian
            sudo apt install -y tokei
        end
    end

    command tokei $argv
end
