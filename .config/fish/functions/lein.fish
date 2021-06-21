function lein
    if ! has lein
        if is-mac
            brew install leiningen
        else
            echo TODO >&2
        end
    end

    command lein $argv
end
