function mitmproxy
    if ! has mitmproxy
        if is-mac
            brew install mitmproxy
        else if is-debian
            sudo apt install -y mitmproxy
        end
    end

    command mitmproxy $argv
end
