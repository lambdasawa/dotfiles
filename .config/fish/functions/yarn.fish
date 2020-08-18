function yarn
    command -v yarn 2>&1 >/dev/null || brew install yarn

    command yarn $argv
end
