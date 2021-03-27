function mysql
    if ! has mysql
        if is-mac
            brew install mysql
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command mysql $argv
end
