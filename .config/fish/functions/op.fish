function op
    if ! has op
        brew cask install 1password-cli
    end

    command op $argv
end
