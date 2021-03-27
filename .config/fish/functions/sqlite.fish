function sqlite
    if ! has sqlite
        if is-mac
            brew install sqlite
        else if is-debian
            echo TODO
            exit 1
        end
    end

    command sqlite $argv
end
