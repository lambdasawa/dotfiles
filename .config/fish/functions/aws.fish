function aws
    if ! command -v aws 2>&1 >/dev/null
        brew install awscli
    end

    command aws $argv
end
