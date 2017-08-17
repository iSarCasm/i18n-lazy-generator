module LazyTranslate
  class KeyContent
    attr_accessor :content, :variables

    def initialize(content, variables = {})
      @content = content
      @variables = variables
    end

    def ==(other)
      other.content == @content && other.variables == @variables
    end
  end
end
