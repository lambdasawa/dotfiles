function amplify
    if ! has amplify
        npm install -g @aws-amplify/cli
        asdf reshim
    end

    command amplify $argv
end
