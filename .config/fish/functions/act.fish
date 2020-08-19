function act
    if ! has act
        if is-mac
            brew install nektos/tap/act
        else if is-debian
            curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
        end
    end

    command act $argv
end
