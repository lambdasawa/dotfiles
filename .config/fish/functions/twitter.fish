function twitter
    if ! has t
        gem install t
    end

    command t $argv
end
