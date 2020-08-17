function git-secrets
    command -v git-secrets 2>&1 >/dev/null || brew install git-secrets

    command git-secrets $argv
end
