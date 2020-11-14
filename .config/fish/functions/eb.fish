function eb
    if ! has eb
        pip install awsebcli --upgrade --user
    end

    command eb $argv
end
