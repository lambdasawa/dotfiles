function ghq
    if ! has ghq
        if is-mac
            brew install ghq
        else if is-debian
            curl -sSLO https://github.com/x-motemen/ghq/releases/download/v1.1.5/ghq_linux_amd64.zip
            unzip ghq_linux_amd64.zip
            mv ghq_linux_amd64/ghq ~/bin
            rm -rf ghq_linux_amd64*
        end
    end

    command ghq $argv
end
