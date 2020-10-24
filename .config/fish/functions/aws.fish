function aws
    if ! command -v aws 2>&1 >/dev/null
        if is-mac
            brew install awscli
        else
            sudo apt install awscli
        end
    end

    command aws $argv
end
