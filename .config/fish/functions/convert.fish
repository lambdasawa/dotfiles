function convert
    if ! has convert
        if is-mac
            brew install imagemagick
        else if is-debian
            sudo apt install -y imagemagick
        end
    end

    command convert $argv
end
