function grex
    if ! command -v grex 2>&1 >/dev/null
        if is-mac
            brew install grex
        else
            echo TODO
            exit 1
        end
    end

    command grex $argv
end
