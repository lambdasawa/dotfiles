function shfmt
    if ! has shfmt
        if is-mac
            brew install shfmt
        else if is-debian
            curl -sSLO https://github.com/mvdan/sh/releases/download/v3.1.2/shfmt_v3.1.2_linux_amd64
            mv shfmt_v3.1.2_linux_amd64 ~/bin/shfmt
            chmod u+x ~/bin/shfmt
        end
    end

    command shfmt $argv
end
