function kubectl
    command -v kubectl 2>&1 >/dev/null || brew install kubernetes-cli

    command kubectl $argv
end
