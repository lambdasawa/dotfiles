function awslocal
    if ! has awslocal
        pip install awscli-local
    end

    command awslocal $argv
end
