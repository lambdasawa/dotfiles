function sops
    command -v sops 2>&1 >/dev/null || brew install sops

    command sops $argv
end
