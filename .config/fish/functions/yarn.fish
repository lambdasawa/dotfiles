function yarn
    command -v yarn 2>&1 >/dev/null || npm i -g yarn

    command yarn $argv
end
