function gitmoji
    if ! has gitmoji
        if is-mac
            brew install gitmoji
        else if is-debian
            npm i -g gitmoji-cli
        end
    end

    command gitmoji $argv
end
