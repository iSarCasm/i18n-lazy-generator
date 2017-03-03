module LazyTranslate
  module ConfigUpdater
    def self.update(source_path: nil, config_path: nil, context: nil)
      data        = File.open(path, 'rb').read
      data_format = path.split('.').last
      new_data    = updated_config(data, data_format)
      File.open(path, 'w') { |f| f.write(new_data) }
    end

    def self.updated_config(source_text, source_type, config_text, context)
      parsed_elements = parse(source_text, source_type)
      context_array   = context.split('/')
      new_keys        = new_keys_hash(config_text, context_array, parsed_elements)
      merge_hash_inside_config(config_text, new_keys)
    end

    private

    def self.parse(source_file, source_type)
      Parser.get_parser(source_type).parse_and_finalize(source_file)
    end

    def self.new_keys_hash(config, context, elements)
      elements.each.with_object({}) do |el, new_hash|
        if el.class == TextElement then
          key_content_pair = {
            KeyNameGenerator.generate(el.content) =>
            KeyContentGenerator.generate(el.content)
          }
          deep_store(new_hash, context, key_content_pair)
        end
      end
    end

    def self.merge_hash_inside_config(config, hash)
      yaml = ::YAML.load(config) || {}
      yaml.deep_merge!(hash)
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
