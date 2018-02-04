module LazyTranslate
  module TextToKeyName
    def self.convert(reader, content)
      raise 'Reader not specified' unless reader
      raise 'No content passed' unless content

      make_unsafe_if_html_used(reader, content) do
        content = reader.substitute_vars_in_text(content) { |erb| erb_to_key(reader, erb) }
        content = HTML.remove_html(content)
        content = to_snake_case(content)
        restrict_word_count(text: content, words: 5)
      end
    end

    private

    def self.make_unsafe_if_html_used(reader, content, &block)
      should_make_unsafe = HTML.contains_html?(content) || reader.contains_link?(content)
      key_name = block.call
      should_make_unsafe ? key_name + '_html' : key_name
    end

    def self.to_snake_case(text)
      text.downcase.gsub(/\s+/, '_').gsub(/\W+/,'')
    end

    def self.restrict_word_count(text: nil, words: 5)
      text.split('_').first(words).join('_')
    end

    def self.erb_to_key(reader, erb)
      reader.link?(erb) ? reader.link_label(erb) : reader.last_identifier(erb)
    end
  end
end
