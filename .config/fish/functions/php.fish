function php
    if ! which php | grep .asdf 2>&1 >/dev/null
        asdf plugin add php

        set v (asdf list all php | grep -iv rc | grep -iv beta | grep -iv alpha | grep 7.)

        if is-mac
            brew install bison re2c libiconv libzip
        end

        asdf install php $v
        asdf global php $v
    end

    command php $argv
end
