module I18n::Lazy::Generator
  class WhiteSpaceElement < ParsedElement
    def initialize parsed_element
      @content = parsed_element.content
      @start   = parsed_element.start
      @end     = parsed_element.end
    end

    def can_add? char, index
      if char =~ /\s/ then
        true
      else
        finish index-1
        false
      end
    end

    def self.transitionable? parsed_element
      parsed_element.content[0] =~ /\s/
    end
  end
end
