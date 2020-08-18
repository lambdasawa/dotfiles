function act
    command -v act 2>&1 >/dev/null || brew install nektos/tap/act

    command act $argv
end

