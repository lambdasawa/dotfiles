function random-string -a n
    if [ -z "$n" ]
        set n 128
    end
    ruby -e "require 'securerandom' ; puts SecureRandom.alphanumeric($n)"
end
