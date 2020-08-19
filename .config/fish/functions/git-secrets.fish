function git-secrets
    if ! has git-secrets
        if is-mac
            brew install git-secrets
        else if is-debian
            sudo apt install -y git-secrets
        end
    end

    command git-secrets $argv
end
