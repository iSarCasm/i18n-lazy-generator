module I18n::Lazy::Generator
  class HAMLParser < I18n::Lazy::Generator::Parser
    def self.parser_elements
      [
        I18n::Lazy::Generator::WhiteSpaceElement,
        I18n::Lazy::Generator::HamlTextElement,
        I18n::Lazy::Generator::HamlErbElement,
        I18n::Lazy::Generator::HamlTagElement,
      ]
    end
  end
end
