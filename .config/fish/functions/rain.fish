function rain
    if ! has rain
        if is-mac
            brew install rain
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command rain $argv
end
