function sam
    if ! command -v sam 2>&1 >/dev/null
        brew tap aws/tap
        brew install aws-sam-cli
    end

    command sam $argv
end
