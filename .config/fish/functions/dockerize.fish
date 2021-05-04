function dockerize
    if ! has dockerize
        if is-mac
            brew install dockerieze
        else if is-debian
            echo TODO >&2
            return 1
        end
    end

    command dockerize $argv
end
