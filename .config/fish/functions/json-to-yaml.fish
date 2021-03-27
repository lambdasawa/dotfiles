function json-to-yaml
    ruby -e 'require "yaml"; require "json"; puts YAML.dump(JSON.load(STDIN))'
end
