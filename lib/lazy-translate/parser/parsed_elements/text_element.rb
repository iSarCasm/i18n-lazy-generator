module LazyTranslate
  class TextElement < ParsedElement
    attr_reader :content, :start, :finish

    def initialize(parsed_element: nil, content: nil, start: nil, finish: nil)
      @content = parsed_element&.content || content
      @start   = parsed_element&.start || start
      @finish  = parsed_element&.finish || finish
    end

    def ==(other)
      content == other.content && start == other.start && finish == other.finish
    end
  end
end
