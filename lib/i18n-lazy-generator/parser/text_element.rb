module I18n::Lazy::Generator
  class TextElement < ParsedElement
    def initialize parsed_element
      @content = parsed_element.content
      @start   = parsed_element.start
      @end     = parsed_element.end
    end
  end
end
