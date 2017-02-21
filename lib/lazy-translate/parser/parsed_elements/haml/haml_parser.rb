module LazyTranslate
  class HAMLParser < LazyTranslate::Parser
    def self.parser_elements
      [
        WhiteSpaceElement,
        HamlTextElement,
        HamlErbElement,
        HamlTagElement,
      ]
    end

    def self.finalize(elements)
      elements.map do |e|
        (e.class == HamlTextElement ? TextElement.new(e) : e)
      end
    end
  end
end
