module LazyTranslate
  class ConfigIO_YML
    def parse(content)
      loaded = ::YAML.load(content) || {}
      loaded.to_h
    end

    def compose(hash)
      
    end
  end
end
