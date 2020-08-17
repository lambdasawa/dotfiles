function delta
    command -v delta 2>&1 >/dev/null || brew install git-delta

    command delta $argv
end
