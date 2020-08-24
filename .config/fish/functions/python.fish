function python
    if ! which python | grep .asdf 2>&1 >/dev/null
        asdf plugin add python

        set v (asdf list all python | grep '^2.' | tail -n 1)

        asdf install python $v
        asdf global python $v
    end

    command python $argv
end
