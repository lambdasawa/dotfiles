function sls
    command -v sls 2>&1 >/dev/null || brew install serverless

    command sls $argv
end
