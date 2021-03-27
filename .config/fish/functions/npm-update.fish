function npm-update
    npx npm-check-updates -u
    npx typesync
    if [ -e package-lock.json ]
        npm i -g npm
        npm i
    end
    if [ -e yarn.lock ]
        npm i -g npm
        yarn
    end
end
