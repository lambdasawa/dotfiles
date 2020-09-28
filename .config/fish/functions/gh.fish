function gh
    if ! has gh
        if is-mac
            brew install gh
        else if is-debian
            curl -sSLO https://github.com/cli/cli/releases/download/v0.11.1/gh_0.11.1_linux_amd64.deb
            sudo apt install -y ./gh_*_linux_amd64.deb
            rm ./gh_*_linux_amd64.deb
        end
    end

    command gh $argv
end
