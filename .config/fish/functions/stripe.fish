function stripe
    if ! has stripe
        if is-mac
            brew install stripe
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command stripe $argv
end
