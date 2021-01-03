function grc
    if ! has grc
        if is-mac
            brew install grc
        else if is-debian
            echo "TODO"
            exit 1
        end
    end

    command grc $argv
end
