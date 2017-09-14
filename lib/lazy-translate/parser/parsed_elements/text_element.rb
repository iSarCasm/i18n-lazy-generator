module LazyTranslate
  class TextElement < ParsedElement
    attr_reader :content, :start, :finish, :line

    def initialize(parsed_element: nil, content: nil, start: nil, finish: nil, line: nil)
      @content = parsed_element&.content || content
      @start   = parsed_element&.start || start
      @finish  = parsed_element&.finish || finish
      @line    = line
    end

    def ==(other)
      content == other.content && start == other.start && finish == other.finish && line == other.line
    end
  end
end
