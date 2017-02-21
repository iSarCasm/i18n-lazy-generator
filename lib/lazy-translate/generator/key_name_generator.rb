require 'pry'
module LazyTranslate
  module KeyName
    def self.generate(content)
      html_safety_control(content) do
        content = LazyTranslate::ERB.substitute_erb_with(content) { |erb| erb_to_key(erb) }
        content = LazyTranslate::HTML.remove_html(content)
        content = to_snake_case(content)
        content = restrict_word_count(text: content, words: 5)
      end
    end

    private

    def self.html_safety_control (content, &block)
      should_add_html = LazyTranslate::HTML.contains_html?(content) || LazyTranslate::ERB.contains_link?(content)
      content = block.call
      should_add_html ? content + "_html" : content
    end

    def self.to_snake_case(text)
      text.downcase.gsub(/\s+/, '_').gsub(/\W+/,'')
    end

    def self.restrict_word_count(text: nil, words: 5)
      text.split('_').first(words).join('_')
    end

    def self.erb_to_key(erb)
      if LazyTranslate::ERB.link?(erb)
        LazyTranslate::ERB.link_label(erb)
      else
        LazyTranslate::ERB.last_identifier(erb)
      end
    end
  end
end
