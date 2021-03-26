function q
    if ! has q
        if is-mac
            brew install q
        else if is-debian
            return 1
        end
    end

    command q $argv
end
