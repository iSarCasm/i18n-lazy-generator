module LazyTranslate
  class ConfigIO_YML
    def parse(content)
      loaded = ::YAML.load(content) || {}
      loaded.to_h
    end

    def compose(hash)
      text = ::YAML.dump(hash)
      text.split("\n").drop(1).join("\n") + "\n"
    end
  end
end
