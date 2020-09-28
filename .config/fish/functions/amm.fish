function amm
    if ! has amm
        if is-mac
            brew install ammonite-repl
        else if is-debian
            echo "TODO"
            exit 1
        end
    end

    command amm $argv
end
