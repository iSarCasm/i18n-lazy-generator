module LazyTranslate
  module ConfigUpdater
    def update(new_translations, content, type)
      config_parser = LazyTranslate.const_get(type.to_s.upcase+'ConfigWriter', true).new(file)
      config_writer = LazyTranslate.const_get(type.to_s.upcase+'ConfigWriter', true).new(file)
      config_hash = config_parser.parse content
      config_writer.add_translations(hash: config_hash, translations: new_translations)
    end

    # def self.update(source_path: nil, config_path: nil, context: nil)
    #   src_data        = File.open(source_path, 'rb').read
    #   src_data_format = source_path.split('.').last
    #   cfg_data        = File.open(config_path, 'rb').read
    #   new_data        = updated_config(src_data, src_data_format, cfg_data, context)
    #   File.open(config_path, 'w') { |f| f.write(new_data) }
    # end
    #
    # def self.updated_config(source_text, source_type, config_text, context)
    #   parsed_elements = parse(source_text, source_type)
    #   context_array   = context.split('/')
    #   new_keys        = new_keys_hash(config_text, context_array, parsed_elements)
    #   merge_hash_inside_config(config_text, new_keys)
    # end
    #
    # private
    #
    # def self.parse(source_file, source_type)
    #   Parser.get_parser(source_type).parse_and_finalize(source_file)
    # end
    #
    # def self.new_keys_hash(config, context, elements)
    #   elements.each.with_object({}) do |el, new_hash|
    #     if el.class == TextElement then
    #       key_content_pair = {
    #         TextToKeyName.convert(el.content) =>
    #         TextToKeyContent.convert(ErbReader, el.content).content
    #       }
    #       deep_store(new_hash, context, key_content_pair)
    #     end
    #   end
    # end
    #
    # def self.merge_hash_inside_config(config, hash)
    #   yaml = ::YAML.load(config) || {}
    #   yaml.deep_merge!(hash)
    #   ::YAML.dump(yaml)
    # end
    #
    # def self.deep_store(hash, array, value)
    #   value = value.clone
    #   array.reverse.each do |layer|
    #     value = { layer => value.clone }
    #   end
    #   hash.deep_merge!(value)
    # end
  end
end
