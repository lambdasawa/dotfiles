function laravel
    if ! which laravel | grep .asdf 2>&1 >/dev/null
        composer global require laravel/installer
    end

    command laravel $argv
end
