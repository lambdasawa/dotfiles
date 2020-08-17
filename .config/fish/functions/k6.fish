function k6
    command -v k6 2>&1 >/dev/null || brew install k6

    command k6 $argv
end
