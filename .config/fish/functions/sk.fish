function sk
    if ! has sk
        if is-mac
            brew install sk
        else if is-debian
            git clone --depth 1 https://github.com/lotabout/skim ~/.skim
            ~/.skim/install
            cp ~/.skim/bin/sk ~/bin/
        end
    end

    command sk $argv
end
