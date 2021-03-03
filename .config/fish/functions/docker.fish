function docker
    if ! has docker
        if is-mac
            brew install docker
        else if is-debian
            sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88 && echo 'deb https://download.docker.com/linux/debian stretch stable' | sudo tee /etc/apt/sources.list.d/docker.list && sudo apt-get update -y && sudo apt-get install -y docker-ce docker-ce-cli containerd.io
        end
    end

    command docker $argv
end
