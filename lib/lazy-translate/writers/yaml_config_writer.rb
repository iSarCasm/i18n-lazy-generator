module LazyTranslate
  class YamlConfigWriter
    attr_reader :config, :config_hash

    def initialize(config)
      @config = config
      @config_hash = ::YAML.load(config) || {}
    end

    def write_keys(keys)
      en_keys = {'en' => keys}
      @config_hash = config_hash.deep_merge!(en_keys)
      @config = ::YAML.dump(config_hash)
    end
  end
end
