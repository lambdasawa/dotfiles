function bundle
    if ! command -v bundle 2>&1 >/dev/null
        gem install bundler
        asdf reshim
    end

    command bundle $argv
end
