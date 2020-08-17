function mitmproxy
    command -v mitmproxy 2>&1 >/dev/null || brew install mitmproxy

    command mitmproxy $argv
end
