module LazyTranslate
  class ConfigParserYML
    def parse(content)
      ::YAML.load(content).to_h
    end
  end
end
