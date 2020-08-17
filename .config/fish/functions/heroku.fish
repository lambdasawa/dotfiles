function heroku
    if ! command -v heroku 2>&1 >/dev/null
        brew tap heroku/brew
        brew install heroku
    end

    command heroku $argv
end
