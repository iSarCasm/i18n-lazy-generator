module I18n::Lazy::Generator
  class HamlErbElement < ParsedElement
    def initialize parsed_element
      @content = parsed_element.content
    end

    def can_add? char, index
      if char != "\n" then
        true
      else
        @finished = true
        false
      end
    end

    def self.transitionable? parsed_element
      parsed_element.content == "=" ||
      parsed_element.content == "-"
    end
  end
end
