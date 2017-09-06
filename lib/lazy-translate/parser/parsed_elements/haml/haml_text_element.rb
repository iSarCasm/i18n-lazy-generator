module LazyTranslate
  class HamlTextElement < ParsedElement
    def initialize parsed_element
      @content = parsed_element.content
      @start   = parsed_element.start
      @finish  = parsed_element.finish
    end

    def can_add? char, index
      if char != "\n" then
        true
      else
        finish! index-1
        false
      end
    end

    def self.transitionable? parsed_element
      parsed_element.content[0] =~ /\w/
    end
  end
end
