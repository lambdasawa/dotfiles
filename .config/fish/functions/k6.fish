function k6
    if ! has k6
        if is-mac
            brew install k6
        else if is-debian
            sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
            echo "deb https://dl.bintray.com/loadimpact/deb stable main" | sudo tee -a /etc/apt/sources.list
            sudo apt update -y
            sudo apt install -y k6
        end
    end

    command k6 $argv
end
