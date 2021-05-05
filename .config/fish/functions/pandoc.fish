function pandoc
    if ! command -v pandoc 2>&1 >/dev/null
        if is-mac
            brew install pandoc
        else
            echo TODO
            exit 1
        end
    end

    command pandoc $argv
end
