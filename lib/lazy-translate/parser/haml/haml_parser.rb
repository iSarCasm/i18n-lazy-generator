module LazyTranslate
  class HAMLParser < LazyTranslate::Parser
    def self.parser_elements
      [
        LazyTranslate::WhiteSpaceElement,
        LazyTranslate::HamlTextElement,
        LazyTranslate::HamlErbElement,
        LazyTranslate::HamlTagElement,
      ]
    end

    def self.finalize(elements)
      elements.map do |e|
        (e.class == LazyTranslate::HamlTextElement ? LazyTranslate::TextElement.new(e) : e)
      end
    end
  end
end
