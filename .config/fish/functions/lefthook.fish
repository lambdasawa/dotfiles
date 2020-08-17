function lefthook
    command -v lefthook 2>&1 >/dev/null || brew install Arkweid/lefthook/lefthook

    command lefthook $argv
end
