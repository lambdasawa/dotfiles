function yaml-to-json
    ruby -e 'require "yaml"; require "json"; puts JSON.dump(YAML.load(STDIN))'
end
