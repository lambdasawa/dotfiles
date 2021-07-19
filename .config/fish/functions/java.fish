function java
    if ! which java | grep .asdf 2>&1 >/dev/null
        asdf plugin add java

        set v (asdf list all java | grep openjdk | grep -v adopt | tail -n 1)

        asdf install java $v
        asdf global java $v
    end

    command java $argv
end
