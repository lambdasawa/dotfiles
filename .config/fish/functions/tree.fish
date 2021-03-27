function tree
    if ! has tree
        if is-mac
            brew install tree
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command tree $argv
end
