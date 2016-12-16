module I18n::Lazy::Generator
  module KeyName
    def self.generate(content)
      html_safety_control(content) do
        content = I18n::Lazy::Generator::ERB.interpolate(content) { |erb| erb_to_key(erb) }
        content = I18n::Lazy::Generator::HTML.remove_html(content)
        content = to_snake_case(content)
        content = restrict_word_count(text: content, words: 5)
      end
    end

    private

    def self.html_safety_control (content, &block)
      should_add_html = I18n::Lazy::Generator::HTML.is_html?(content) || I18n::Lazy::Generator::ERB.contains_link?(content)
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
      if I18n::Lazy::Generator::ERB.link?(erb)
        I18n::Lazy::Generator::ERB.link_label(erb)
      else
        I18n::Lazy::Generator::ERB.last_identifier(erb)
      end
    end
  end
end
