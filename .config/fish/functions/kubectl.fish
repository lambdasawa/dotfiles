function kubectl
    if ! has kubectl
        if is-mac
            brew install kubernetes-cli
        else if is-debian
            sudo apt install -y kubernetes-client
        end
    end

    command kubectl $argv
end
