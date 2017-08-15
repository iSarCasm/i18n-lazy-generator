module LazyTranslate
  module SourceUpdater
    def self.update(path)
      data        = File.open(path, 'rb').read
      data_format = path.split('.').last
      new_data    = update_source(data, data_format)
      File.open(path, 'w') { |f| f.write(new_data) }
    end

    def self.update_source(source_text, source_type)
      parsed_elements = parse(source_text, source_type)
      parsed_elements = substitute_text_with_keys(parsed_elements)
      join_elements_to_text(parsed_elements)
    end

    private

    def self.parse(source_file, source_type)
      Parser.get_parser(source_type).parse_and_finalize(source_file)
    end

    def self.substitute_text_with_keys(elements)
      elements.each do |el|
        if el.class == TextElement then
          el.content = "=t('.#{TextToKeyName.convert(el.content)}')"
        end
      end
    end

    def self.join_elements_to_text(elements)
      elements.each.with_object("") do |el, text|
        text << el.content
      end
    end
  end
end
