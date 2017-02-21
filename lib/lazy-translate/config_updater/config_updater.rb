module LazyTranslate
  module ConfigUpdater
    def self.updated_config(source_text, source_type, context, config_text)
      parsed_elements = parse(source_text, source_type)
      context_array   = context.split('/')
      new_keys        = new_keys_hash(config_text, context_array, parsed_elements)
      merge_hash_inside_config(config_text, new_keys)
    end

    private

    def self.parse(source_file, source_type)
      if source_type == :haml then
        @elements = LazyTranslate::HAMLParser.parse_and_finalize(source_file)
      end
    end

    def self.new_keys_hash(config, context, elements)
      elements.each.with_object({}) do |el, new_hash|
        if el.class == LazyTranslate::TextElement then
          deep_store(new_hash, context, {LazyTranslate::KeyName.generate(el.content) => el.content})
        end
      end
    end

    def self.merge_hash_inside_config(config, hash)
      yaml = ::YAML.load(config) || {}
      yaml.deep_merge!(hash)
      ::YAML.dump(yaml)
    end

    # REFACTOR: move out!
    def self.deep_store(hash, array, value)
      value = value.clone
      array.reverse.each do |layer|
        value = { layer => value.clone }
      end
      hash.deep_merge!(value)
    end
  end
end
