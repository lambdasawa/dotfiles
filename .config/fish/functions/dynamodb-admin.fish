function dynamodb-admin
    which dynamodb 2>&1 >/dev/null || npm install -g dynamodb-admin

    command dynamodb-admin $argv
end
