function exa
    if ! has exa
        if is-mac
            brew install exa
        else if is-debian
            sudo apt install -y zip
            curl -sSL -O https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
            unzip exa-linux-x86_64-0.9.0.zip
            mv exa-linux-x86_64 ~/bin/exa
            rm exa-linux-x86_64-0.9.0.zip
        end
    end

    command exa $argv
end
