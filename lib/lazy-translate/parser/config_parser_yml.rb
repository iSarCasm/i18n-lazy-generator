module LazyTranslate
  class ConfigParserYML
    def parse(content)
      loaded = ::YAML.load(content) || {}
      loaded.to_h
    end
  end
end
