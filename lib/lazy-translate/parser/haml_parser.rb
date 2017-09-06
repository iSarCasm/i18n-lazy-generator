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
      elements.keep_if do |e|
        e.class == HamlTextElement
      end.map do |e|
        TextElement.new(parsed_element: e)
      end
    end
  end
end
