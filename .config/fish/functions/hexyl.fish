function hexyl
    command -v hexyl 2>&1 >/dev/null || brew install hexyl

    command hexyl $argv
end
