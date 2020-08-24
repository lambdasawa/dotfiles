function fkill
    if ! has fkill
        npm i -g fkill-cli
        asdf reshim
    end

    command fkill $argv
end
