function hugo
    if ! has hugo
        if is-mac
            brew install hugo
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command hugo $argv
end
