function sops
    if ! has sops
        if is-mac
            brew install sops
        else if is-debian
            curl -sSLO https://github.com/mozilla/sops/releases/download/v3.6.0/sops-v3.6.0.linux
            mv sops-v3.6.0.linux ~/bin/sops
            chmod u+x ~/bin/sops
        end
    end

    command sops $argv
end
