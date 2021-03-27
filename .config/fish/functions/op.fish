function op
    if ! has op
        brew install --cask 1password-cli
    end

    command op $argv
end
