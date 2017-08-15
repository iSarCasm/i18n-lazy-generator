module LazyTranslate
  module TextToKeyName
    def self.convert(content)
      make_unsafe_if_html_used(content) do
        content = ERB.substitute_erb_with(content) { |erb| erb_to_key(erb) }
        content = HTML.remove_html(content)
        content = to_snake_case(content)
        restrict_word_count(text: content, words: 5)
      end
    end

    private

    def self.make_unsafe_if_html_used (content, &block)
      should_make_unsafe = HTML.contains_html?(content) || ERB.contains_link?(content)
      content = block.call
      should_make_unsafe ? content + "_html" : content
    end

    def self.to_snake_case(text)
      text.downcase.gsub(/\s+/, '_').gsub(/\W+/,'')
    end

    def self.restrict_word_count(text: nil, words: 5)
      text.split('_').first(words).join('_')
    end

    def self.erb_to_key(erb)
      ERB.link?(erb) ? ERB.link_label(erb) : ERB.last_identifier(erb)
    end
  end
end