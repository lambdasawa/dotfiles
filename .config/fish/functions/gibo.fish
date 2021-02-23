function gibo
    if ! has gibo
        if is-mac
            brew install gibo
        else if is-debian
            echo TODO >&2 && exit 1
        end
    end

    command gibo $argv
end
