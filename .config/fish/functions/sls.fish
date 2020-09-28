function sls
    if ! has sls
        if is-mac
            brew install serverless
        else if is-debian
            npm i -g serverless
        end
    end

    command sls $argv
end
