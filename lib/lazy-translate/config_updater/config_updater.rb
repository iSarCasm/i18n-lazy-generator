module LazyTranslate
  module ConfigUpdater
    def self.run(source_text, source_type, context, config_text)
      parse(source_text, source_type)
      add_new_keys(config_text, context.split('/'))
    end

    private

    def self.parse(source_file, source_type)
      if source_type == :haml then
        @elements = LazyTranslate::HAMLParser.parse_and_finalize(source_file)
      end
    end

    def self.add_new_keys(config, context)
      yaml = ::YAML.load(config) || {}
      new_hash = {}
      @elements.each do |el|
        if el.class == LazyTranslate::TextElement then
          deep_store(new_hash, context, {LazyTranslate::KeyName.generate(el.content) => el.content})
        end
      end
      yaml.deep_merge!(new_hash)
      ::YAML.dump(yaml)
    end

    def self.deep_store(hash, array, value)
      value = value.clone
      array.reverse.each do |layer|
        value = { layer => value.clone }
      end
      hash.deep_merge!(value)
    end
  end
end
