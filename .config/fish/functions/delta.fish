function delta
    if ! has delta
        if is-mac
            brew install git-delta
        else if is-debian
            curl -sSLO https://github.com/dandavison/delta/releases/download/0.4.1/git-delta_0.4.1_amd64.deb
            sudo dpkg -i git-delta_0.4.1_amd64.deb
            rm git-delta_0.4.1_amd64.deb
        end
    end

    command delta $argv
end
